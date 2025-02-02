## BUAA-CO_Lab（2020版）

北航计算机学院计算机组成实验部分课程设计。课设分9个project：p0~p8，从零开始搭建一个支持中断异常的可综合的五级流水线CPU（MIPS微系统）。

该课程采取闯关制度，就是通过了这个project才能进行下一个project，过不了某一关就一直卡在这一关直到通过为止（当然一直卡在某一关的情况感觉很少）。每个project分为课下测试与课上测试两部分。课下测试即课下有相应的任务，完成了任务通过了cscore上的测试点之后才能参加该project的课上测试。课上测试实际上就是某周固定时间的上机，一般三到题过两道就算通过本次project了，如果没过就下周上机继续测这个project（但下一个project的课下测试会开放，这一周如果有时间可以做下一个project的课下）。p0\~p6每个project的课下测试有一周完成时间，p7\~p8每个project有两周的课下时间。

由于今年的计组上机时间设在了周六8:00（啊好痛苦），和四六级考试冲突了一次。。课程组和其他课协商了调课最后没调成功，毕竟要考虑到来自11个院系的选课同学的排课情况（这么多院系啊。。不愧是6系精品课.jpg），所以呢今年的p8就取消了，也不知道该庆幸还是该惋惜。

笔者跌跌撞撞最后也过了p7，算是成功通关了。以下一点经验分享希望能帮助到大家。（但P8是帮不到了www...）

#### Pre~P2

Pre的课下内容要安排好进度好好学，不过也无需太超前，logisim、verilog、mips是进行后面几个p的基础。当然如果附加题不会也不用太死磕（大型logisim的连线是真的费精力hhh），毕竟pre的课下和课上都不计入总成绩的。

pre的课上测试通过条件为3/3，logisim、verilog、mips各出一道，难度大概课下中等水平，不过两小时内写完并de完bug可并不容易，挂的人不在少数。不过Pre挂不挂不影响后面的project进度，所以重在参与啦哈哈

- logisim：重点掌握Moore和Mealy型有限状态机的搭法:

  ![屏幕截图 2021-01-02 121248.jpg](https://i.loli.net/2021/01/02/yB1HLa6NRYCfzG8.jpg)

  学明白了状态机，这些搭法其实都是很公式化模式化的。

  - p0考的就是logisim，通过条件为课上2h内ac两道，三道是优秀的必要条件。除了p2时间变为2.5h外，其余的p课上测试都沿袭这套评价标准，2h内ac2/3通过，3/3优秀。
  - p0课下注意了解下logisim里那几个不常用的元件，可能某些你想实现的功能某个元件就可以实现了。（比如`bit finder`，可以用于找到一列数里最高位的1，当时p0第三题用这个可以瞬间节省好多精力，有些不知道这个元件的同学只能搭一堆复杂的门电路，还很有可能出bug；以及div元件，其中一个接口就是余数，有不知道的同学自己求余数又会浪费很多时间）。

- verilog：

  力荐verilog做题网站：[HDLBits](https://hdlbits.01xz.net/wiki/Main_Page) 还有相应的[题解专栏](https://zhuanlan.zhihu.com/p/56646479) ，对变量类型以及状态机搭建方法等等不懂的同学可以在上面练一练，有的附有图片非常直观。其中有时候学到的一些奇技淫巧说不定某天就会派上用场（最有用的感觉还是：①例如`a[i:i-7]`会报错，改为`a[i-:7]`就可以 ②状态机的三段式写法 ③`always@(*)`以及内部`for`循环的顺畅使用）。
  
  - p1考的是verilog，考场上组合逻辑与时序逻辑都会考到。
  - 一定不要轻视组合逻辑，要确保自己对`assign`以及`always@(*)`的使用与坑点十分熟练，（比如判断一列二进制数里1的个数，怎么写？）。对于状态机而言，三段式写法十分丝滑，但要注意一个点，即第一段`always@(*)`的状态转移逻辑中，只能用于判断次态逻辑，不可以用来计数、置`flag`为1等操作，因为其在上升下降沿都会触发，从而导致出现问题。对于计数，要将其放在第二段的时序逻辑中，而需要`flag`的操作实际上可以用增加状态来替代。
  
- MIPS：

  初学时感觉比较繁琐，但正常练习情况下这些语句很容易就记住了。递归可能略有复杂，但只要理解到他的原理，自己练几个就明白了。

  - p2考MIPS，自己课下可以找几个C语言片段翻译一下。我们考的是一个签到题+约瑟夫环+二分查找/快排。二分/快排这个难度会给C语言片段，但很玄学，有的同学照着他的片段翻译就会出现部分点TLE的状况。

#### P3 单周期基于logisim的CPU

主要是数据通路+控制单元。大部分实现，教程以及各老师的PPT中都已经给出来了，照着搭就好。课上就是给三个指令来实现，自己课下可以尝试做几个指令集里的指令。如果模块化做得好，课上会很轻松。

注意，对于CPU内部的修改，是否能在输出的数据中体现。以及有时间的话搞明`lb,lh`等指令的工作方式，`h`类和`b`类指令的题目描述（RTL）如果没了解过的话比较难看懂。

#### P4 单周期基于verilog的CPU

把logisim翻译成verilog语言即可。`MOVZ`当时坑了不少同学，可以照着英文指令集实现一下。（多说几句，其实每个project的课上测试后几次和前几次题目差的不会很多，如果进度有落后的同学可以找进度快的同学问问课上测试的题目，自己课下实现一下，通过几率会大大提升）

以及我的verilog都是在vscode上写的，也推荐大家在vsc上写，毕竟ISE自带的编辑器是在一言难尽，用vsc无论是编辑还是查找替换都十分方便，能大大提高大家的编程速度和舒适度。（以及由于vsc和ISE的编码不同，vsc上的中文注释在ISE中打开会是乱码）

#### P5 多周期基于verilog的CPU

这里突然复杂了起来，没有思路的话建议多读几遍教程和高老板PPT。多的部分其实大概就是AT信号译码+流水线寄存器+转发暂停控制。AT法真的大大简化了流水线CPU的实现，从以往学长的描述中可以看出不用AT法时的繁琐。但即便如此，细节也还是非常多，建议如果深陷于复杂的细节中理不清头绪，不妨跳出细节从宏观角度看一下。无非就是后面的流水线要读的地址与前面流水线要写的地址相同并且写入的数据已经产生好了（根据AT的译码来判断），但因为还没写进GRF读取不到，那么就把数据发送过来呗。然后加点特判，比如不能转发写0寄存器的数据，以及M到D的转发特殊一点，因为有GRF所以可以用内部转发来实现。为了防止还没转发更新的数据产生错误的效果，就需要引入暂停来阻塞D级指令。

课上如果没有课下准备的话并不简单，我们当时很能考不定向写+条件写/跳。也就是不能直接在指令里判断出要写入的寄存器或是否写入寄存器。其实条件写可以看做是不定向写的弱化版（不写寄存器的话就把写地址改为0,）。具体的可以在课下实现一下英文指令集中的`MOVZ`以及`bgezal`。

#### P6 多周期基于verilog的CPU（50条指令）

在p5基础上操作很简单，无脑搬砖即可。一个难点是乘除模块，其实是一个带计数器的有限状态机。只要在暂停里加一个“如果当前乘除块在操作（busy|start），而且D级指令是与乘除有关的操作，那么暂停”，就可以了。

课上考的和p5差不多，注意课下实现点条件写+不定向写（没时间的话只实现条件写也对课上帮助很大），课上就会很轻松。

#### P7 异常中断，MIPS微系统

主要是加CP0，Bridge，异常判断。CP0看上去细节十分复杂，实际上就是实现三个寄存器的部分功能，如果实在不会，可以参看各学长的实现，其实都大同小异。Bridge其实就是一个双向的多路选择器，判断往哪个timer里写，从哪个timer里读。exception的判断逻辑认真一点即可，比较容易。流水线注意不清BD和PC。

课下注意做好充足的测试，课上就是两中强测+强测+一个送分题。测试数据自己不会造可以翻以往学长的github。

#### p8

据说是奖励关，要实现可综合，并且要装不少东西，实现一些接口。不过通常p8已经进入考试周，注意权衡利弊，毕竟计组课设只有2学分左右，并且过了P7也能拿86~92（大部分87，88）的分数。（多提一句，大物是真考的难，准确的说是又偏又怪，感觉像是专门想要考倒学生一样，但它学分还高，一定要注意多留时间给大物）

#### Tips

机组助教会有课程组、小程序组、网站建设组等等，有机会一定要加啊，即便CO学的不是多强，但参加个网站建设组什么的做做工程岂不是美滋滋。

以及从零开始到最后做出一个MIPS微系统很有成就感，希望大家能体会到探索与求知的乐趣，而不仅仅局限于过了p几。个人感觉无论是理论课还是课设都是比较偏重于精深，如果想更宏观一点来看计算机的组成，那么个人推荐[这个课](https://www.coursera.org/learn/jisuanji-zucheng/home/welcome)，每个知识点讲的比较浅，但串联起来就很舒服，脉络很清晰。

祝大家计组之旅顺利~