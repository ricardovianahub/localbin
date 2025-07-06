@echo --- --- Git Pull from all subfolders
for /d %%d in (*) do @cmd /c "cd %%d && echo --- %%d && git pull"
