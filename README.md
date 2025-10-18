# 🚀 Neovim Code Assistant

Transform your Neovim into a powerful AI-powered coding assistant, similar to Cursor but right inside your favorite editor! This plugin brings intelligent code generation directly to Neovim using Google's Gemini AI.

## ✨ Features

- **AI-Powered Code Generation**: Generate code by simply describing what you want
- **Seamless Neovim Integration**: Works natively within your Neovim workflow
- **Powered by Gemini**: Leverages Google's advanced Gemini AI model
- **Simple Command Interface**: Just type `:Code` and describe your needs
- **Context-Aware**: Understands your current buffer and project context

## 📋 Prerequisites

- Neovim 0.8+ 
- A plugin manager (Packer, Lazy.nvim, vim-plug, etc.)
- Google Gemini API key

## 🔧 Installation

### Step 1: Install a Plugin Manager (if you don't have one)

#### Using Lazy.nvim (Recommended)
```bash
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
```

#### Using Packer
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Step 2: Install This Plugin

#### With Lazy.nvim
Add to your `~/.config/nvim/lua/plugins.lua` or `~/.config/nvim/init.lua`:

```lua
{
  'jash-jetly/nvim-code',
  config = function()
    require('nvim-code').setup()
  end
}
```

#### With Packer
Add to your `~/.config/nvim/lua/plugins.lua`:

```lua
use {
  'jash-jetly/nvim-code',
  config = function()
    require('nvim-code').setup()
  end
}
```

#### With vim-plug
Add to your `~/.config/nvim/init.vim`:

```vim
Plug 'jash-jetly/nvim-code'
```

### Step 3: Set Up Gemini API Key

#### Get Your API Key
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Copy the generated key

#### Add to Your Shell Configuration

**For Zsh users** (`~/.zshrc`):
```bash
export GEMINI_API_KEY="your_gemini_api_key_here"
```

**For Bash users** (`~/.bashrc`):
```bash
export GEMINI_API_KEY="your_gemini_api_key_here"
```

**Apply the changes:**
```bash
# For Zsh
source ~/.zshrc

# For Bash  
source ~/.bashrc
```

## 🎯 Usage

### Basic Usage

1. Open Neovim
2. Type `:Code` followed by your request
3. Watch as the AI generates code for you!

### Examples

```vim
:Code create a function to calculate fibonacci numbers in Python

:Code write a React component for a todo list with add and delete functionality

:Code generate a SQL query to find users who haven't logged in for 30 days

:Code create a Rust function to parse JSON and handle errors gracefully

:Code write unit tests for the current function
```

### Advanced Usage

- **Context-Aware Generation**: The plugin understands your current file type and context
- **Multi-line Requests**: Describe complex requirements in natural language
- **Code Modification**: Ask to modify or improve existing code in your buffer

## ⚙️ Configuration

You can customize the plugin behavior in your Neovim configuration:

```lua
require('nvim-code').setup({
  -- Custom configuration options will go here
  model = "gemini-pro",
  max_tokens = 2048,
  temperature = 0.7,
})
```

## 🔍 Troubleshooting

### Common Issues

**API Key Not Found**
- Ensure `GEMINI_API_KEY` is set in your shell configuration
- Restart your terminal and Neovim after setting the environment variable
- Verify with: `echo $GEMINI_API_KEY`

**Plugin Not Loading**
- Make sure you've run `:PackerSync` (Packer) or restarted Neovim (Lazy.nvim)
- Check for any error messages with `:messages`

**No Response from AI**
- Check your internet connection
- Verify your API key is valid and has quota remaining
- Check Neovim's `:messages` for error details

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Google Gemini AI for powering the code generation
- The Neovim community for the amazing editor
- Cursor for inspiration

---

**Made with ❤️ for the Neovim community**

*Transform your coding experience - one `:Code` command at a time!*