## BUAA-CO_Lab（2020版）

北航计算机学院计算机组成实验部分课程设计。课设分9个project：p0~p8，从零开始搭建一个支持中断异常的可综合的五级流水线CPU（MIPS微系统）。

该课程采取闯关制度，就是通过了这个project才能进行下一个project，过不了某一关就一直卡在这一关直到通过为止（当然一直卡在某一关的情况感觉很少）。每个project分为课下测试与课上测试两部分。课下测试即课下有相应的任务，完成了任务通过了cscore上的测试点之后才能参加该project的课上测试。课上测试实际上就是某周固定时间的上机，一般三到题过两道就算通过本次project了，如果没过就下周上机继续测这个project（但下一个project的课下测试会开放，这一周如果有时间可以做下一个project的课下）。p0~p6每个project的课下测试有一周完成时间，p7~p8每个project有两周的课下时间。

由于今年的计组上机时间设在了周六8:00（啊好痛苦），和四六级考试冲突了一次。。课程组和其他课协商了调课最后没调成功，毕竟要考虑到来自11个院系的选课同学的排课情况（这么多院系啊。。不愧是6系精品课.jpg），所以呢今年的p8就取消了QAQ，也不知道该庆幸还是该惋惜。

笔者跌跌撞撞最后也过了p7，算是成功通关了。以下一点经验分享希望能帮助到大家。（但P8是帮不到了〒▽〒）

#### Pre~P2

Pre的课下内容要安排好进度好好学，logisim、verilog、mips是进行后面几个p的基础。当然如果附加题不会也不用死磕（大型logisim的连线是真的费精力hhh），毕竟pre的课下和课上都不计入总成绩的。

- logisim：重点掌握Moore和Mealy型有限状态机的搭法:

  ![屏幕截图 2021-01-02 121248.jpg](https://i.loli.net/2021/01/02/yB1HLa6NRYCfzG8.jpg)

  学明白了状态机，这些搭法其实都是很公式化模式化的。

- verilog：

  力荐verilog做题网站：[HDLBits](https://hdlbits.01xz.net/wiki/Main_Page) 还有相应的[题解专栏](https://zhuanlan.zhihu.com/p/56646479) ，对变量类型以及状态机搭建方法等等不懂的同学可以在上面练一练，有的附有图片非常直观。其中有时候学到的一些奇技淫巧（划掉）说不定某天就会派上用场
  
  

pre的课上测试通过条件为3/3，logisim、verilog、mips各出一道，难度大概课下中等水平，不过两小时内写完并de完bug可并不容易，挂的人不在少数。不过Pre挂不挂不影响后面的project进度，所以重在参与啦哈哈



