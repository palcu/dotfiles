export PYTHONSTARTUP=$HOME/.pythonrc

# Alias IPython by default
if command -v ipython > /dev/null; then
    alias python="ipython"
fi
if command -v ipython3 > /dev/null; then
    alias python3="ipython3"
fi
