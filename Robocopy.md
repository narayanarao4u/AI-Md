To achieve this using `xcopy`, you can utilize its command-line options for selective copying. However, since `xcopy` doesn't inherently support excluding folders based on specific names like `node_modules`, you'll need to pair it with additional logic, such as using a batch file or a tool like `robocopy`, which provides exclusion capabilities.

Here's an example solution using `robocopy` instead (a more robust alternative for this task):

```cmd
robocopy D:\Rao_Projects\VSKP_GRY_10K_RUN K:\VSKP_GRY_10K_RUN /E /XD node_modules
```

### Explanation:
- `D:\Rao_Projects\VSKP_GRY_10K_RUN`: The source directory.
- `K:\VSKP_GRY_10K_RUN`: The destination directory.
- `/E`: Copies all subdirectories, including empty ones.
- `/XD node_modules`: Excludes directories named `node_modules` and all their subfolders.

Let me know if you'd like me to refine this further or provide help with another approach!