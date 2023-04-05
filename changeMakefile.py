with open('darknet/Makefile') as f:
    lines = f.readlines()

for index, line in enumerate(lines):
    if line.split('=')[0] == 'GPU':
        lines.pop(index)
        lines.insert(index, 'GPU=1\n')

    if line.split('=')[0] == 'CUDNN':
        lines.pop(index)
        lines.insert(index, 'CUDNN=1\n')
    
    if line.split('=')[0] == 'OPENCV':
        lines.pop(index)
        lines.insert(index, 'OPENCV=1\n')

    if line.split('=')[0] == 'LIBSO':
        lines.pop(index)
        lines.insert(index, 'LIBSO=1\n')

with open('darknet/Makefile', 'w') as f:
    f.writelines(lines)