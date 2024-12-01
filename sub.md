The `:substitute` command in Neovim is highly flexible and offers various combinations for search-and-replace tasks. Here's a comprehensive guide to its syntax and options:

### Basic Syntax
```vim
:[range]s[ubstitute]/{pattern}/{replacement}/[flags]
```
- **`[range]`**: Specifies the lines on which the command should operate.
  - `:` - Current line.
  - `1,5` - Lines 1 to 5.
  - `%` - Entire file.
  - `'<,'>` - Selected lines in visual mode.
  - `.`, `$`, `^` - Current line, last line, or beginning of the file.
- **`{pattern}`**: The text to find.
- **`{replacement}`**: The text to replace it with.
- **`[flags]`**: Modifies the behavior of the substitution.

---

### Flags
- `g`: Global replacement in the line (replace all matches).
- `c`: Confirm each substitution interactively.
- `i`: Ignore case in the search.
- `I`: Case-sensitive search (overrides `ignorecase` setting).
- `n`: Show the number of occurrences but don't substitute.
- `e`: Suppress errors if no matches are found.
- `r`: Use extended regex (if supported by your configuration).
- `p`: Print the line after substitution.

---

### Examples
1. **Replace the first occurrence of "foo" with "bar" in the current line:**
   ```vim
   :s/foo/bar/
   ```

2. **Replace all occurrences of "foo" with "bar" in the current line:**
   ```vim
   :s/foo/bar/g
   ```

3. **Replace all occurrences in the entire file:**
   ```vim
   :%s/foo/bar/g
   ```

4. **Case-insensitive replacement:**
   ```vim
   :%s/foo/bar/gi
   ```

5. **Interactive confirmation for each substitution:**
   ```vim
   :%s/foo/bar/gc
   ```

6. **Find and replace with a count of matches only:**
   ```vim
   :%s/foo/bar/gn
   ```

7. **Replace in a range of lines (e.g., lines 10–20):**
   ```vim
   :10,20s/foo/bar/g
   ```

8. **Replace in visually selected lines:**
   - Enter visual mode and select text.
   - Execute:
     ```vim
     :'<,'>s/foo/bar/g
     ```

9. **Substitute and print each modified line:**
   ```vim
   :%s/foo/bar/gp
   ```

---

### Advanced Usage

1. **Use regex groups:**
   Replace "abc123" with "123abc":
   ```vim
   :%s/\(abc\)\(123\)/\2\1/
   ```

2. **Avoid replacing substrings (word boundaries):**
   Replace only "cat" but not "catfish":
   ```vim
   :%s/\<cat\>/dog/g
   ```

3. **Use an empty replacement to delete matches:**
   Remove all occurrences of "foo":
   ```vim
   :%s/foo//g
   ```

4. **Replace special characters:**
   Escape characters like `/`:
   ```vim
   :%s/\/path\/to\/file/\/new\/path\/to\/file/g
   ```

5. **Replace across multiple files:**
   - Open multiple files using `:args` or `:argdo`.
   - Run substitution:
     ```vim
     :argdo %s/foo/bar/ge | update
     ```

---

### Quick Reference
| Command                         | Description                                      |
|---------------------------------|--------------------------------------------------|
| `:s/foo/bar/`                   | Replace first occurrence in current line         |
| `:s/foo/bar/g`                  | Replace all occurrences in current line          |
| `:%s/foo/bar/g`                 | Replace all occurrences in the file              |
| `:10,20s/foo/bar/g`             | Replace within a specific range of lines         |
| `:'<,'>s/foo/bar/g`             | Replace in visually selected text                |
| `:%s/foo/bar/gc`                | Confirm each replacement in the file             |
| `:args *.txt | argdo %s/foo/bar/ge | update` | Replace in multiple files          |

These combinations and customizations can handle nearly all substitution tasks effectively! Let me know if you need help with specific patterns or customizations.


Here’s a detailed explanation and examples for the **Advanced Usage** of the `:substitute` command in Neovim:

---

### **1. Use Regular Expression Groups**
Regex groups allow you to capture parts of the matched pattern and rearrange them in the replacement.

**Example:**
- Input: `abc123`
- Replace `abc123` with `123abc`:
  ```vim
  :%s/\(abc\)\(123\)/\2\1/
  ```
  **Explanation:**
  - `\(abc\)` captures "abc" as group `\1`.
  - `\(123\)` captures "123" as group `\2`.
  - In the replacement, `\2\1` means "group 2 followed by group 1".

**Practical Use:**
- Swap first and last names in a file:
  ```vim
  :%s/\(\w\+\) \(\w\+\)/\2 \1/
  ```
  - Matches `Firstname Lastname` and swaps it to `Lastname Firstname`.

---

### **2. Avoid Replacing Substrings (Word Boundaries)**
Sometimes you want to replace a whole word, not part of a larger word.

**Example:**
- Input: `cat`, `catfish`
- Replace only `cat`:
  ```vim
  :%s/\<cat\>/dog/g
  ```
  **Explanation:**
  - `\<` marks the beginning of a word.
  - `\>` marks the end of a word.
  - This ensures only the word "cat" is replaced, not parts of other words like "catfish".

---

### **3. Use an Empty Replacement to Delete Matches**
You can effectively "delete" text by leaving the replacement part empty.

**Example:**
- Remove all occurrences of `foo` in the file:
  ```vim
  :%s/foo//g
  ```

**Practical Use:**
- Remove trailing whitespace from each line:
  ```vim
  :%s/\s\+$//e
  ```
  - `\s\+$` matches trailing whitespace.
  - `//` deletes it.
  - `e` flag suppresses errors if no match is found.

---

### **4. Replace Special Characters**
If your search or replacement string contains characters like `/`, `&`, or `\`, you need to escape them.

**Example:**
- Replace `/path/to/file` with `/new/path/to/file`:
  ```vim
  :%s/\/path\/to\/file/\/new\/path\/to\/file/g
  ```

**Shortcut:**
- Use a different delimiter to avoid escaping `/`:
  ```vim
  :%s#/path/to/file#/new/path/to/file#g
  ```

---

### **5. Case Transformation in Replacement**
Neovim supports case transformation within replacement text.

**Examples:**
- Convert matched text to uppercase:
  ```vim
  :%s/\(foo\)/\U\1/g
  ```
  - `\U` converts the following characters to uppercase until `\E` or the end of the replacement.

- Capitalize the first letter:
  ```vim
  :%s/\(foo\)/\u\1/g
  ```
  - `\u` capitalizes the first character of the match.

- Convert to lowercase:
  ```vim
  :%s/\(FOO\)/\L\1/g
  ```
  - `\L` converts the following characters to lowercase.

---

### **6. Replace Across Multiple Files**
Neovim can perform substitutions in multiple files at once using `:argdo`, `:bufdo`, or `:cdo`.

**Example:**
- Replace `foo` with `bar` in all `.txt` files in the current directory:
  ```vim
  :args *.txt
  :argdo %s/foo/bar/ge | update
  ```
  **Explanation:**
  - `:args *.txt` loads all `.txt` files into the argument list.
  - `:argdo` runs the command on each file in the argument list.
  - `%s/foo/bar/ge` performs the substitution.
  - `| update` saves the changes.

**Practical Use:**
- Replace in all open buffers:
  ```vim
  :bufdo %s/foo/bar/ge | update
  ```

---

### **7. Conditional Substitution**
You can use Vim’s conditional features in substitutions.

**Example:**
- Replace only if a match occurs in a specific context:
  Replace `foo` only if it’s followed by `bar`:
  ```vim
  :%s/foo\(.*bar\)/baz\1/g
  ```

---

### **8. Debugging Complex Patterns**
For complex patterns, it’s helpful to highlight matches before substitution.

**Example:**
- Highlight `foo` without replacing:
  ```vim
  :match ErrorMsg /foo/
  ```
- Clear highlights:
  ```vim
  :match none
  ```

---

### **Quick Summary of Regex Constructs**
| Regex        | Matches                                       |
|--------------|-----------------------------------------------|
| `.`          | Any single character.                        |
| `*`          | Zero or more occurrences of the preceding.   |
| `\+`         | One or more occurrences of the preceding.    |
| `\?`         | Zero or one occurrence of the preceding.     |
| `\|`         | Logical OR (e.g., `foo\|bar`).               |
| `\w`         | Word characters (letters, digits, `_`).      |
| `\s`         | Whitespace (spaces, tabs).                   |
| `\d`         | Digits.                                      |
| `\b`         | Word boundary.                               |

---

These advanced techniques allow you to handle highly specific and complex substitution tasks. Let me know if you'd like help with a particular use case!
