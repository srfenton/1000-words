import os
import pymongo

# Connect to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Drop the entire database if it exists
if "1000words" in client.list_database_names():
    client.drop_database("1000words")
    print("Dropped existing database: 1000words")

# Define the database
db = client["1000words"]
print("Connected to database: 1000words")

# Path to the vocab directory
vocab_dir = "vocab"

# Loop through each file in the vocab directory
for filename in os.listdir(vocab_dir):
    if filename.endswith(".txt"):
        collection_name = os.path.splitext(filename)[0]
        collection = db[collection_name]

        # Read and parse the file
        filepath = os.path.join(vocab_dir, filename)
        print(f"Processing file: {filepath}")

        with open(filepath, "r", encoding="utf-8") as file:
            lines = file.readlines()
            if not lines:
                continue

            # Get headers from the first row
            headers = lines[0].strip().split("\t")
            print(f"Headers: {headers}")

            documents = []
            for line in lines[1:]:
                parts = line.strip().split("\t")
                if len(parts) == len(headers):
                    doc = dict(zip(headers, parts))
                    documents.append(doc)

            if documents:
                collection.insert_many(documents)
                print(f"Inserted {len(documents)} documents into {collection_name}")

print("All files processed and collections created.")
