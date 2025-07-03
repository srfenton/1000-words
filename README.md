# Vocabulary Quiz CLI (Ruby)

This is a simple Ruby command-line flashcard quiz app that helps you practice vocabulary in different languages. It reads vocabulary files from the `vocab/` directory and quizzes you with multiple-choice questions.

## Directory Structure

```
your_project/
├── vocab/
│   ├── italian.txt
│   ├── spanish.txt
│   └── french.txt
├── quiz.rb
└── README.md
```

Each `.txt` file should be tab-delimited and structured like this:

```
id	target_language	english
1	casa	house
2	uomo	man
3	sole	sun
```

Make sure there is a header row and each row contains at least three tab-separated fields: an ID, the word in the target language, and the English translation.

## How It Works

1. The script lists all `.txt` files inside the `vocab/` directory.
2. You select a language by number.
3. It parses the selected file and loads the vocabulary.
4. Then it gives you 5 random multiple-choice questions:
   - You are shown the English word.
   - You choose the correct translation from four options (a–d).
   - It tells you whether your answer is correct and shows the correct answer if not.
5. The quiz avoids repeating questions you've already seen.

## How to Run

```bash
ruby quiz.rb
```

Make sure you are in the root directory of the project when running the command and that the `vocab` folder exists.

## Requirements

- Ruby (tested with Ruby 2.7+)
- A terminal that supports `system("clear")` (macOS/Linux/WSL; for Windows, replace with `system("cls")` if needed)

## Customization

- Add more vocab files in the `vocab/` directory using the correct format.
- Adjust the number of quiz questions by modifying this line:

```ruby
for i in 0...5
```

## Notes

- The script uses a `seen` list to avoid repeating already tested words in a session.
- It currently supports only one direction (target language → English).

