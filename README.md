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

## How to Use

If you're new to the command line, don't worry — here’s a step-by-step guide to get started on macOS or Linux.

### 1. Open the Terminal

- On **macOS**: Press `Cmd + Space`, type `Terminal`, and hit Enter.  
- On **Linux**: Look for “Terminal” in your application menu or press `Ctrl + Alt + T`.

### 2. Install Ruby (if not already installed)

To check if Ruby is installed, type:

```bash
ruby -v
```

If you don’t see a version (e.g., `ruby 3.1.2`), install Ruby using:

- **macOS**: `brew install ruby` (you’ll need [Homebrew](https://brew.sh))
- **Ubuntu/Linux**: `sudo apt install ruby`

### 3. Download the Project

To get the project files:

```bash
git clone https://github.com/srfenton/1000-words.git
cd 1000-words
```

> If you don’t have Git installed, install it first:  
> - **macOS**: `brew install git`  
> - **Ubuntu/Linux**: `sudo apt install git`

### 4. Run the Quiz

Make sure you're inside the project folder. Then type:

```bash
ruby quiz.rb
```

The app will:

- Show a list of available languages.
- Ask you to choose one.
- Give you a short multiple-choice quiz using vocabulary from the corresponding file.



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

