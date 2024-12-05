Neovim (and Vim) provides a variety of registers to store and manage text. These registers have specific purposes and are categorized as follows:

---

### **1. Unnamed Register (`"`):**
- Stores the last deleted or yanked text.
- Automatically used when no specific register is specified.

---

### **2. Numbered Registers (`0`–`9`):**
- **`"0` (Yank Register):**
  - Stores the most recently yanked text.
  - Does not store deleted text.
- **`"1` to `"9`:**
  - Store deleted text in sequence.
  - `"1` contains the most recent deletion, `"2` the one before that, and so on.
  - Large deletes (e.g., using `d`, `c`, `x`) go into `"1` and shift older deletions down the chain.

---

### **3. Small Delete Register (`"-`):**
- Stores small deletions (e.g., single characters or words deleted with commands like `x` or `dw`).

---

### **4. Named Registers (`a`–`z` and `A`–`Z`):**
- **Lowercase letters (`"a`–`"z`):**
  - Store text explicitly using a command like `"ayy` (yank into `a` register) or `"add` (delete into `a` register).
- **Uppercase letters (`"A`–`"Z`):**
  - Append to the corresponding lowercase register.
  - Example: `"Ayy` appends to register `a`.

---

### **5. Read-Only Registers:**
- **`":` (Command Register):**
  - Stores the last executed command-line command.
- **`"/` (Search Register):**
  - Stores the last search pattern.
- **`"%` (File Name Register):**
  - Stores the current file name.
- **`"#` (Alternate File Register):**
  - Stores the alternate file name (the last file edited before the current one).

---

### **6. Expression Register (`"=`):**
- Allows evaluating an expression and inserting the result.
- Example:
  - Type `i<C-R>=5+3<CR>` in insert mode to insert `8`.

---

### **7. Black Hole Register (`"_`):**
- Deletes text without saving it anywhere.
- Example:
  - `"_:d` deletes text without affecting other registers.

---

### **8. System Clipboard Registers (`"+` and `"*`):**
- **`"+` (Clipboard Register):**
  - Interacts with the system clipboard (`xclip` or `wl-clipboard` on Linux, clipboard on macOS/Windows).
- **`"*` (Primary Selection Register):**
  - Interacts with the primary selection (useful in Linux environments with X11).

---

### **9. Last Inserted Text Register (`".`):**
- Stores the last inserted text.
- Useful for repeating insertions.

---

### **10. Last Yanked Text Register (`"0`):**
- Contains the text from the most recent yank operation.

---

### **11. Macro Registers (`"q`, etc.):**
- Stores recorded macros.
- For example, if you record a macro in register `q`, it is stored in `"q`.

---

### **12. Alternate Register (`"~`):**
- Used for toggling case.

---

### **Accessing Registers**
- Use `:reg` to view the contents of all registers.
- Use a specific register by prefixing commands with `"`, such as `"ap`, `"byy`, or `"_d`.


### **13. Argument Register (`"#`):**
- **`"#` Register:**
  - Contains the name of the alternate file (i.e., the last file you edited before the current one).
  - Used to switch back and forth between two files.

---

### **14. Error Register (`"~`):**
- **`"~` Register:**
  - Stores the most recently executed error message.
  - Not frequently used but available for inspecting error messages programmatically.

---

### **15. Debug Register (`"@`):**
- **`"@` Register:**
  - Stores the name of the last used register in a macro or other action.

---

### **16. Repeat Register (`".`):**
- **`".` Register:**
  - Stores the last inserted text.
  - Allows you to repeat an insertion with commands like `".p` or `i<C-R>."`.

---

### **17. Global Registers (`g` Registers):**
- **`"g{char}` Registers:**
  - These are available for plugins or user-defined purposes.
  - Typically empty unless specifically used in scripts or plugins.

---

### **18. System-Specific Registers:**
Some configurations or plugins extend Vim’s behavior to include additional registers for specific systems or environments, like:
- **Clipboard Managers:** Additional interaction with clipboard tools (e.g., clipboard history).
- **Plugin-Specific Registers:** Some plugins (e.g., `vim-visual-multi`) may introduce custom registers.

---

### Viewing All Registers
To get a full list of **all registers in your current session**, including any extended or plugin-based ones:
1. Run `:reg` to display all the current registers and their contents.
2. Use `:h registers` in Neovim to learn more about each specific register.

