# Configure

## Managing Multiple Python Versions

work with different Python versions, combining `pyenv` with `virtualenv` is usually the best and most flexible choice. This setup provides full control over Python versions while enabling easy environment management per project

 * [pyenv](https://github.com/pyenv/pyenv)

 ```bash
   # Install a specific version
   pyenv install 3.8.20
   # Set a global version
   pyenv global 3.8.20
   # Set a local version for a project
   pyenv local 3.9.7 
   #    
   python -m venv ./.venv
 ```