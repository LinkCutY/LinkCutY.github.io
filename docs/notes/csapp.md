# CSAPP 深入理解计算机系统笔记

开一个天坑，记录从 $0$ 开始学习 CSAPP 的历程。

## 第一章 $\text{Course-interview}$

视频链接：[**Lecture 1**](https://www.bilibili.com/video/BV1a54y1k7YE/?vd_source=4f640b4af0c085f4b8163a07a1236562)

### 引入

在视频中学习到：`300 * 400 * 500 * 600` 与 `400 * 500 * 600 * 300` 得到的结果是完全相同的，尽管他们都会溢出。这说明溢出的结果与乘法的顺序无关。

同时，运行两份代码：

```c
for (i = 0; i < n; i ++ )
    for (j = 0; j < n; j ++ )
        b[i][j] = a[i][j];
```

```c
for (j = 0; j < n; j ++ )
    for (i = 0; i < n; i ++ )
        b[i][j] = a[i][j];
```

尽管得到的结果相同，但是后者比前者慢了二十倍。这是由于读取顺序导致的。

### 前置知识：$\text{Linux}$ 命令

需要掌握下面这几条命令：

1. `--help` 当不明白一个命令的时候可以用命令加上 `--help` 来获取帮助。如果你想查找一个命令中的某个详细用法，可以使用 `state --help | grep "key"` 来查找这个用法。例如，当我想要知道 `ls` 命令中 `-h` 是什么意思，可以写：

```bash
ls --help | grep " \-h "
```

在我的本机，会输出：

```bash
      --full-time            like -l --time-style=full-iso
  -h, --human-readable       with -l and -s, print sizes like 1K 234M 2G etc.
  -l                         use a long listing format
```

2. `ls`：列出当前目录中的内容。他的几个扩展用法如下：
   
   - 使用 `ls path` 可以列出 `path` 这个文件夹下的文件。
   - 使用 `ls -a` 可以列出隐藏文件。
   - 使用 `ls -h` 可以以人类可读方式列出文件（这里指的是文件大小）；
   - 使用 `ls -l` 可以列出文件详细信息。
一般使用的时候，直接 `ls -alh` 即可。

例如在我的本机某个文件夹里，用 `ls -alh` 会输出：

```bash
~/csapp/week1$ ls -alh
total 44K
drwxr-xr-x 4 LinkCutY LinkCutY 4.0K Oct 30 21:02 .
drwxr-xr-x 4 LinkCutY LinkCutY 4.0K Oct 30 16:39 ..
-rwxr-xr-x 1 LinkCutY LinkCutY  205 Oct 30 16:25 CMakeLists.txt
-rwxr-xr-x 1 LinkCutY LinkCutY  710 Oct 30 16:25 README.md
drwxr-xr-x 2 LinkCutY LinkCutY 4.0K Oct 30 16:25 build
drwxr-xr-x 3 LinkCutY LinkCutY 4.0K Oct 30 16:26 build-cmake
-rwxr-xr-x 1 LinkCutY LinkCutY  100 Oct 30 16:25 greet.cpp
-rwxr-xr-x 1 LinkCutY LinkCutY  207 Oct 30 16:25 greet.h
-rwxr-xr-x 1 LinkCutY LinkCutY  162 Oct 30 16:25 main.cpp
-rwxr-xr-x 1 LinkCutY LinkCutY  162 Oct 30 16:25 main.cpp.bak
-rwxr-xr-x 1 LinkCutY LinkCutY 1.8K Oct 30 16:25 run.sh
```

3. `pwd`：查询当前所在目录。

4. `cd`：切换到某个文件夹。常见的几种用法如下：
   - `cd PATH`：切换到 `PATH` 这个目录。
   - `cd ..`：退回上一级目录。
   - `cd -`：回到上一次所在目录。这个命令可以实现目录间的切换。

5. `cat`：显示文件内容。例如我写了一个 `main.cpp`，如果输入

```bash
cat main.cpp
```

就会输出：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1$ cat main.cpp
#include <iostream>
#include <string>
#include "greet.h"

int main() {
    std::string name = "CSAPP";
    std::cout << greet(name) << std::endl;
    return 0;
}
```

`cat` 常见的其他用法如下：

- `cat -n` 带行号输出。
- `cat -A` 显示隐藏字符。例如换行符 `$`。
- `cat -e` 显示换行符，

6. `find`：查找某个路径下的文件是否存在。他常见使用两个参数：`-name`，`-size`。例如我写

```bash
find -name build
```

可以自动返回该目录下的所有名字是 `build` 文件或文件夹。

7. 重点指令：`nm`

输入 `nm` 可以返回一个二进制文件中的符号表。例如我建立了一个 `main.cpp` 编译成 `main.o`。使用 `nm main.o` 就可以返回：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ nm main.o
0000000000000000 r .L.str
0000000000000006 r .L.str.1
0000000000000000 V DW.ref.__gxx_personality_v0
0000000000000000 r GCC_except_table0
0000000000000000 r GCC_except_table1
0000000000000000 r GCC_except_table4
0000000000000000 r GCC_except_table7
                 U _Unwind_Resume
                 U _Z5greetRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
                 U _ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
                 U _ZNSolsEPFRSoS_E
0000000000000000 W _ZNSt11char_traitsIcE6lengthEPKc
0000000000000000 W _ZNSt15__new_allocatorIcED2Ev
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_
0000000000000000 W _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
0000000000000000 W _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
0000000000000000 W _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
                 U _ZSt19__throw_logic_errorPKc
                 U _ZSt21ios_base_library_initv
                 U _ZSt4cout
                 U _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
                 U _ZSt9terminatev
                 U _ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
0000000000000000 W _ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
0000000000000000 W _ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
0000000000000000 W __clang_call_terminate
                 U __cxa_begin_catch
                 U __gxx_personality_v0
0000000000000000 T main
                 U strlen
```

其中第二列表示符号类型。

常用的用法如下：

 - `nm -C name.o`：解码 C++ 文件
 - `nm -u name.o`：只显示未定义的 `U`。

8. `rm` 删除一个文件。例如：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ touch test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ ls
greet.o  hello  main.i  main.o  main.s  test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ rm test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ ls
greet.o  hello  main.i  main.o  main.s
```
可以看到，我输入 `touch` 之后新建了一个文件。而输入 `rm` 之后又将他删除了。

`rm -f` 可以强制删除文件。如果想要删除文件夹，则要用 `rm -r`。可以对比一下下面的指令：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ mkdir test
LinkCutY@LAPTOP-4UOO6KLK:~$ ls
cmake  code  csapp  cuda-repo-wsl-ubuntu-12-8-local_12.8.0-1_amd64.deb  dev  git-practice  notes  papers  shim  test
LinkCutY@LAPTOP-4UOO6KLK:~$ rm test
rm: cannot remove 'test': Is a directory
```

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ mkdir test
LinkCutY@LAPTOP-4UOO6KLK:~$ ls
cmake  code  csapp  cuda-repo-wsl-ubuntu-12-8-local_12.8.0-1_amd64.deb  dev  git-practice  notes  papers  shim  test
LinkCutY@LAPTOP-4UOO6KLK:~$ rm -r test
LinkCutY@LAPTOP-4UOO6KLK:~$ ls
cmake  code  csapp  cuda-repo-wsl-ubuntu-12-8-local_12.8.0-1_amd64.deb  dev  git-practice  notes  papers  shim
```

9. `cp`：复制备份文件。

经常见到需要备份文件的场景，按照如下执行就可以做到备份：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ cd csapp/week1/build
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ ls
greet.o  hello  main.i  main.o  main.s
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ cp main.o main.o.bak
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ ls
greet.o  hello  main.i  main.o  main.o.bak  main.s
```

注：通常使用 `.bak` 文件作为备份文件的后缀名。

`cp` 常见的用法如下：

- `cp PATH1/file1 PATH2/file2` 将 `file1` 复制到别处的 `file2`。
- `cp -r` 可以复制文件夹和文件夹中的内容。具体可以看下面指令：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1$ mkdir test
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1$ ls
CMakeLists.txt  README.md  build  build-cmake  greet.cpp  greet.h  main.cpp  main.cpp.bak  run.sh  test
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1$ cp test test1
cp: -r not specified; omitting directory 'test'
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1$ cp -r test test1
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1$ ls
CMakeLists.txt  README.md  build  build-cmake  greet.cpp  greet.h  main.cpp  main.cpp.bak  run.sh  test  test1
```
- `cp -a`：保留复制文件的所有属性（时间戳，权限等等）

10. `mv`：移动或重命名

我认为这个指令的主要作用是重命名文件。使用

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ mv main.o main1.o
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ ls
greet.o  hello  main.i  main.s  main1.o
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ mv main1.o main.o
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ ls
greet.o  hello  main.i  main.o  main.s
```

看 `ls` 的内容可以看出，`mv file1 file2` 可以将 `file1` 重命名为 `file2`。

11. 重点指令 `grep`：可以在输入内容中找指定内容。

例如，我写

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ touch test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ nm -C main.o > test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ cat test.txt
0000000000000000 r .L.str
0000000000000006 r .L.str.1
0000000000000000 V DW.ref.__gxx_personality_v0
0000000000000000 r GCC_except_table0
0000000000000000 r GCC_except_table1
0000000000000000 r GCC_except_table4
0000000000000000 r GCC_except_table7
                 U _Unwind_Resume
                 U greet(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_data() const
                 U std::ostream::operator<<(std::ostream& (*)(std::ostream&))

以下省略若干行
```

可以将 `main.o` 的信息输出到 `test.txt`。

接下来如果我输入：

```bash
grep " U " -n test.txt
```

就会返回

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ grep " U " -n test.txt
8:                 U _Unwind_Resume
9:                 U greet(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
10:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_data() const
11:                 U std::ostream::operator<<(std::ostream& (*)(std::ostream&))
14:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_dispose()
15:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_capacity(unsigned long)
16:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider::_Alloc_hider(char*, std::allocator<char> const&)
19:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_local_data()
20:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_set_length(unsigned long)
21:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_S_copy_chars(char*, char const*, char const*)
22:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_data(char*)
23:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_create(unsigned long&, unsigned long)
25:                 U std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string()
26:                 U std::__throw_logic_error(char const*)
27:                 U std::ios_base_library_init()
28:                 U std::cout
29:                 U std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)
30:                 U std::terminate()
31:                 U std::basic_ostream<char, std::char_traits<char> >& std::operator<< <char, std::char_traits<char>, std::allocator<char> >(std::basic_ostream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
35:                 U __cxa_begin_catch
36:                 U __gxx_personality_v0
38:                 U strlen
```

这里的 `-n` 仅用于显示行号。

因此我们可以用 `grep` 迅速寻找文件中的指定内容。

当然 `grep` 使用时并不是总是需要建一个临时文件来存储输入内容。这个后面会讲。

12. 管道 `|`

实现内容的串联流动。可以用来避免临时文件的建立。例如上一节的例子：我们需要输入

```bash
touch test.txt
nm -C main.o > test.txt
grep " U " -n test.txt
```

来找到 `main.o` 中符号为 `U` 的部分。

但是管线给我们提供了：`|` 前面的输出通过管道进入 `|` 后面的部分。因此可以用：

```bash
nm -C main.o | grep -n " U "
```

实现与上面三行相同的功能。

13. `>` 命令：将输出写入文件（覆盖写入）

例如，我们想要将 `nm main.o` 的内容写入一个文件 `test.txt`，就可以用

```bash
nm -C main.o > test.txt
```

14. `echo`：输出内容。例如我写 `echo "what is this" what is this` 就会输出：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ echo "what is this" what is this
what is this what is this
```

如果我想要向文件中写入内容，就可以使用上一条的 `>`，例如：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ echo "what is this" > test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ cat test.txt
what is this
```

注意这里的 `>` 是覆盖写入。如果我追加一句：`echo "there's nothing here" > test.txt`，就可以看到：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ echo "there's nothing here" > test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ cat test.txt
there's nothing here
```

15. `>>` 追加内容

如果我不想要覆盖，而是想在后面加入内容，则可以使用 `>>` 代替 `>`。例如在上面的例子之后这样写

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ echo "there is something" >> test.txt
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ cat test.txt
there's nothing here
there is something
```

可以看到 `there is something` 是追加到末尾的。

16. `head` / `tail`：输出开头 / 结尾若干行的内容。

接着上面的例子，如果我想要 `test.txt` 第一行的内容，就可以使用：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ head -1 test.txt
there's nothing here
```

注：这里使用 `head -n 1` 也是可以的）

如果想要输出最后一行，可以使用：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ tail -1 test.txt
there is something
```

那么如果我有一个比较大的文件，例如，我将 `main.o` 的内容输入到了 `test.txt`

```bash
nm -C main.o > test.txt
```

那么我想要获得 `main.o` 的第五行，是否可以用 `head -5 test.txt` 呢？

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ head -5 test.txt
0000000000000000 r .L.str
0000000000000006 r .L.str.1
0000000000000000 V DW.ref.__gxx_personality_v0
0000000000000000 r GCC_except_table0
0000000000000000 r GCC_except_table1
```

结果返回了五行。这说明 `head` 是返回前多少行，而不是从前往后第几行。这时候需要再用一次 `tail`：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ head -5 test.txt | tail -1
0000000000000000 r GCC_except_table1
```

17. 这里是几个技巧和常识：

- 按 `Ctrl + C` 可以中断命令。
- 按上下箭头可以切换上一次输入 / 下一次输入的命令
- 按 `Tab` 可以自动补全路径
- 按 `Ctrl + R` 可以搜索历史命令

18. 补充：`objdump` 反汇编

一般用 `objdump -d`，返回的是汇编中的指令。常见的指令有：

`push`，`pop`，`mov`, `lea`, `sub`, `add`, `call`, `ret`, `jmp` 等。

使用 `--no-show-raw-insn` 可以省略机器码输出。例如对于 `main.o`，下面两个指令输出如下：

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ objdump -d main.o | sed -n '/<main>:/,+12p'
0000000000000000 <main>:
   0:   55                      push   %rbp
   1:   48 89 e5                mov    %rsp,%rbp
   4:   48 81 ec 90 00 00 00    sub    $0x90,%rsp
   b:   c7 45 dc 00 00 00 00    movl   $0x0,-0x24(%rbp)
  12:   48 8d 55 b7             lea    -0x49(%rbp),%rdx
  16:   48 89 55 e0             mov    %rdx,-0x20(%rbp)
  1a:   48 8b 45 e0             mov    -0x20(%rbp),%rax
  1e:   48 89 45 f8             mov    %rax,-0x8(%rbp)
  22:   48 8d 35 00 00 00 00    lea    0x0(%rip),%rsi        # 29 <main+0x29>
  29:   48 8d 7d b8             lea    -0x48(%rbp),%rdi
  2d:   e8 00 00 00 00          call   32 <main+0x32>
  32:   e9 00 00 00 00          jmp    37 <main+0x37>
```

```bash
LinkCutY@LAPTOP-4UOO6KLK:~/csapp/week1/build$ objdump -d --no-show-raw-insn main.o | sed -n '/<main>:/,+12p'
0000000000000000 <main>:
   0:   push   %rbp
   1:   mov    %rsp,%rbp
   4:   sub    $0x90,%rsp
   b:   movl   $0x0,-0x24(%rbp)
  12:   lea    -0x49(%rbp),%rdx
  16:   mov    %rdx,-0x20(%rbp)
  1a:   mov    -0x20(%rbp),%rax
  1e:   mov    %rax,-0x8(%rbp)
  22:   lea    0x0(%rip),%rsi        # 29 <main+0x29>
  29:   lea    -0x48(%rbp),%rdi
  2d:   call   32 <main+0x32>
  32:   jmp    37 <main+0x37>
```

`%rbp` 表示栈底，`%rsp` 表示栈顶。后面会有涉及。

19. `2>&1` 和 `2>`

这里涉及到一个输出端口的问题。`Linux` 默认有三个 IO 端口：

- `0`：输入端
- `1`：输出端，输出正常信息到终端屏幕
- `2`：输出端，输出报错信息到终端屏幕

而上面所说的 `>` 其实是 `1>` 的省略形式。因此如果想要将 `2` 端口也重定向，就需要 `2>` 这样的指令。

例如，如果我根目录下没有 `nope` 这个文件夹。我使用 `ls ./nope` 显然会报错。

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ ls ./nope
ls: cannot access './nope': No such file or directory
```

但如果我想要把报错信息写道 `test.log` 里，如果我写 `ls ./nope > test.log`

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ ls ./nope > test.log
ls: cannot access './nope': No such file or directory
LinkCutY@LAPTOP-4UOO6KLK:~$ cat test.log
LinkCutY@LAPTOP-4UOO6KLK:~$
```

并没有输出。

这其实是因为 `>` 只重定向了正常信息的输出端，而报错信息仍然未重定向，默认输出到终端。

如果使用

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ ls ./nope 2> test.log
LinkCutY@LAPTOP-4UOO6KLK:~$ cat test.log
ls: cannot access './nope': No such file or directory
```

可以看到 `test.log` 里面出现了内容。

那么如果我想要将正常内容和报错内容同时输出到一个文件里呢？

当然我们可以用 `命令 1> FILE 2> FILE`，但是更简单的办法是用 `命令 > FILE 2>&1`。

```bash
LinkCutY@LAPTOP-4UOO6KLK:~$ ls ./nope > test.log 2>&1
LinkCutY@LAPTOP-4UOO6KLK:~$ cat test.log
ls: cannot access './nope': No such file or directory
```

解释一下这个语句：`ls ./nope > test.log` 已经将端口 `1` 重定向到了 `test.log`。这时候如果我写 `2>&1`，`2>` 就是将 `2` 号端口重定向，`&1` 表示 `1` 号端口之前重定向的位置。这样就将 `2` 定向到了 `1` 指向的 `test.log`。

### 编译顺序

一个 c 语言的文件，例如 `hello.c`，在编译的过程中经过：

```bash
hello.c -> hello.i -> hello.s -> hello.o -> hello
```

的过程。根据书本上的内容，每一步做的事情是这样的：

```bash
hello.c --------------> hello.i ------------------> hello.s
        把头文件贴进去            编译成汇编语言程序

        -----------------------> hello.o --------------------------> hello
         汇编器把它翻译成机器语言           将标准库中的目标文件（机器码）链接进来
```

### 计算机的硬件构成

这里让 agent 做了一个图形化界面帮助理解；中间还进行了对话解决了一些问题；

![img1](/images/csapp/01.png)

这是一个加法程序开始前的状态。在开始后，首先将可执行文件中的机器码从磁盘载入主存（实际是按需分页，用到哪页读哪页）

![img2](/images/csapp/02.png)

接下来，CPU 读程序入口，然后将一个地址发给主存（内存）。这里 agent 解决的几个关键问题：

- 发射的是地址不是指令。
- 发出的地址只是一个读请求，并不涉及程序的内容。这是 CPU 想要读取该地址上的内容。
- 返回的内容是请求读取的那部分指令，这个过程就是取指。

![img3](/images/csapp/03.png)

接下来，主存读到地址并返回该地址的指令（应该是虚拟地址后面要转换），指令存进指令寄存器 $\mathbf{IR}$。一个重点是，这里 `LOAD A` 并不是将 `a` 取出，而是返回了一个指令。这反映了 `CPU` 是运算与控制单元、也是唯一能「理解」指令的地方；程序相关的内容需要让主存（实际是 `cache`）告诉他。

这里，`LOAD A` 是一条指令的语义，而这条指令是属于指令集的。

![img4](/images/csapp/04.png)

接下来，CPU 从 `LOAD A` 中译出 $a$ 的地址，向主存（`cache`）发射请求，取回 $a$ 存入一个寄存器；取 $b$ 是**另一条指令**（如 `LOAD B`），需要再走一遍取指、译码、访存。

![img5](/images/csapp/05.png)

![img6](/images/csapp/06.png)

之后，寄存器将 $a, b$ 输出到运算单元 `ALU`，进行运算后返回另外一个寄存器存储。

![img7](/images/csapp/07.png)

![img8](/images/csapp/08.png)

寄存器将结果通过总线写回主存；输出时由 CPU 把数据送到图形适配器（真实路径是系统调用 → 终端 → 显卡），主存不会主动转发。

![img9](/images/csapp/09.png)

![img10](/images/csapp/10.png)

### 缓存

书中写的是高速缓存，实际上就是缓存（$\text{cache}$）。

缓存的工作原理：CPU 访问某个地址（取指或取数），读取该地址的信息。主存将该地址附近 $64$ 字节的信息副本全部通过内存总线发射到 $\mathrm{L2}$，再建副本发送至 $\mathrm{L1}$。处理器从 $\mathrm{L1}$ 读取所需地址下的数据。下次再次访问该地址附近内容时，先去 $\mathrm{L1}$ 读取，如果 $\text{miss}$ 就访问 $\mathrm{L2}$ 进一步寻址。如果寻址失败再回到主存寻址。

> 该地址附近是指该地址所在的内存块，计算方法为 `x & (~0x3F)`

判断命中靠地址拆分：高位是 tag，中间是 index（选中哪一组），低位是 offset（在这 64 字节里选第几个字节）。用 index 找到组、再比 tag，一次比较即可判断命中。

未命中时要逐级回填：主存 → L3 → L2 → L1，每一级都留一份副本，而不是只把数据交给 CPU。

现在的计算机一般有三阶缓存。

### 进程和线程

线程 $\subseteq$ 进程。一个进程内多个线程可以并发。

下面会介绍并行和并发。

### 并行和并发

可以理解为，并行是真正的同时执行，而并发是逻辑上的同时推进。

例如一个处理器上多个进程在运行，从核的角度上看，这些进程是并发执行的；而从进程的角度看，它自己的工作在持续推进，仿佛独占处理器，但这只是切换造成的错觉，本质上仍然是并发。

一个计算机系统存在多级并发。例如，处理器上并发执行多个进程，一个进程内并发运行多个线程，而一个线程内的多条指令则是并行执行的（指令级并行）。

这里的并发并不是完全意义上的并列。同时运行的进程 / 线程个数有上界，但是处理器会进行进程 / 线程间的切换，导致多个进程的进度接近统一，因此看起来仿佛并列。

### Amdahl 定律

设程序某个部分在整体中所占比重为 $\alpha$，而对他优化提升了 $k$ 倍的效率。设未优化时程序运行的时间为 $T_{\text{OLD}}$，而优化后的时间为 $T_{\text{NEW}}$，则 $T_{\text{NEW}} = T_{\text{OLD}} [(1 - \alpha) + \cfrac{\alpha}{k}]$

因此提升比例

$$
s = \cfrac{T_{\text{OLD}}}{T_{\text{NEW}}} = \dfrac{1}{(1 - \alpha) + \dfrac{\alpha}{k}}
$$


## CUDA 算子初步

### 一个例子

CUDA 算子是一个以 `.cu` 结尾的文件，分为 `main`，`kernel` 等部分。下面是一个简单的 CUDA 算子。

```cpp
#include <cstdio>
#include <cstdlib>

__global__ void order(int *a, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) a[i] = i;
}
int main(void) {
    int n = 1048576;
    size_t bytes = n * sizeof(int);
    int *h_out = (int*)malloc(bytes);
    int *d_out;
    cudaMalloc(&d_out, bytes);
    
    int ThreadsPerBlock = 256;
    int BlocksPerGrid = (n + ThreadsPerBlock - 1) / ThreadsPerBlock;
    order<<<BlocksPerGrid, ThreadsPerBlock>>>(d_out, n);
    
    cudaMemcpy(h_out, d_out, bytes, cudaMemcpyDeviceToHost);
    bool flag = 1;
    for (int i = 0; i < n; i ++ )
        flag &= (h_out[i] == i);
    
    puts(flag ? "OK" : "Wrong");
    free(h_out);
    cudaFree(d_out);
    return 0;
}
```

这里将各个部分拆解：

1. `size_t bytes = n * sizeof(int);`：先定义数组中的字节数。这里用 `size_t` 是为了防止数值太大越界。一般规定内存大小都使用 `size_t` 类型。

2. 

```cpp
int *h_out = (int*)malloc(bytes);
int *d_out;
cudaMalloc(&d_out, bytes);
```

先解释一下 `h_out` 和 `d_out` 的含义：`h_out` 即指 `host_out`，`d_out` 即指 `device_out`。这里的 `host` 是指 `CPU` 和主存，而 `device` 则包含 `GPU` 和 显存。

我们在 `CPU` 侧开了 `bytes` 大小的空间，然后再从 `CPU` 侧向 `GPU` 侧发送指令，在 `CPU` 侧开 `bytes` 的空间（`cudaMalloc(&d_out, bytes);`）。

3. 

```cpp
int ThreadsPerBlock = 256;
int BlocksPerGrid = (n + ThreadsPerBlock - 1) / ThreadsPerBlock;
order<<<BlocksPerGrid, ThreadsPerBlock>>>(d_out, n);
```

这里的 `ThreadsPerBlock` 是指每个块内的线程数，线程的概念在上文已经提到。这里取的是理论经验值，也可以换为其他 $32$ 的倍数。

而 `BlocksPerGrid` 是指块数。`Grid` 每个 `kernel` 只有一个。因此能够算出来总的线程数是 `ThreadsPerBlock * BlocksPerGrid > n`。这里注意 `(n + ThreadsPerBlock - 1) / ThreadsPerBlock` 是一种常见的上取整的写法。

下面的 `order<<<Grid, Block>>>(arg1, arg2)` 就是 `kernel`。其中尖括号内参数的顺序是固定的，而后面的 `(arg1, arg2 ... argn)` 是根据自己写的 `kernel` 传入的。

4. `cudaMemcpy(h_out, d_out, bytes, cudaMemcpyDeviceToHost);`

这一步是从 `Device` 侧将计算完成的结果拷贝回 `HOST` 侧。这里的 `cudaMemcpyDeviceToHost` 就是表达这个拷贝方向。

这一步之后，`h_out` 中的结果就是计算的答案。

接下来看 `kernel` 主体部分：

5. 
```cpp
__global__ void order(int *a, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) a[i] = i;
}
```

`__global__` 是用来表明这是一个 `kernel`。

这里的 `blockDim` 是指每个 `block` 里有几个线程（也就是 `ThreadsPerBlock`），`blockIdx` 是标定现在所在的是第几个块。他们相乘就得到在他之前有多少线程。

`threadIdx` 是指在当前 `block` 当前，现在在处理的线程编号。所以 `blockDim.x * blockIdx.x + threadIdx.x` 计算的实际上是当前线程在所有线程中的编号。

这里的 `i < n` 判断的原因是：`ThreadsPerBlock * BlocksPerGrid` 得到的结果实际上是大于 `n` 的。为了避免访问界外显存，要进行一下判断。

6. `free(h_out); cudaFree(d_out);`

这个部分是用来清空内存和显存的。如果不清空，循环连续跑多次 `kernel` 就会炸掉显存。

### 一个线程处理多个元素

现在一个线程里只做 `a[i] = i`。如果能在一个线程内做完 `a[i] = i, a[i + 1] = i + 1, a[i + 2] = i + 2, a[i + 3] = i + 3`，这样会省很多时间。

