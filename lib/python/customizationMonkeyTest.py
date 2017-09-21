#!/usr/bin/python
#encoding:utf-8
import random
import sys

#参数1 LANDSCAPE/PORTRAIT 是否横屏，默认横屏
#参数2 实际分辨率(x,y)，例如：2560*1440
#参数3 apk包名package和活动进程名，例如：com.boyaa.enginegzguiyangqp.main*com.boyaa.enginegzguiyangqp.main.Game
#参数4 fileName
#命令如：python customizationMonkeyTest.py LANDSCAPE 2560*1440
# com.boyaa.enginegzguiyangqp.main/com.boyaa.enginegzguiyangqp.main.Game /var/stf/tmp/monkey.txt
class ClickMonkey:
    def __init__(self,x1,y1,x2,y2):
        self.DefaultX=x1
        self.DefaultY=y1
        self.ActualyX=x2
        self.ActualyY=y2
    def clickdpi(self,x,y):
        clickx = x*self.ActualyX/self.DefaultX
        clicky = y * self.ActualyY/self.DefaultY
        return clickx,clicky

if __name__=='__main__':
    # package = 'com.boyaa.enginegzguiyangqp.main'
    # activity = 'com.boyaa.enginegzguiyangqp.main.Game'
    horizontal=sys.argv[1]
    #dx = int(sys.argv[1].split('*')[0])
    #dy = int(sys.argv[1].split('*')[1])
    # dx=1960
    # dy=1080
    ax = int(sys.argv[2].split('*')[0])
    ay = int(sys.argv[2].split('*')[1])
    package=sys.argv[3].split('/')[0]
    activity=sys.argv[3].split('/')[1]
    fileName=sys.argv[4]
   #print fileName
    if horizontal=='LANDSCAPE':
        dx = 1960
        dy = 1080
        FirstX1=20
        FirstY1=40
        FirstX2=1930
        FirstY2=1030
    elif horizontal=='PORTRAIT':
        dx = 1080
        dy = 1960
        FirstX1 = 40
        FirstY1 = 20
        FirstX2 = 1030
        FirstY2 = 1930
    else:
        print 'input err,change it to default'
        dx = 1960
        dy = 1080
        FirstX1 = 20
        FirstY1 = 40
        FirstX2 = 1930
        FirstY2 = 1030
    print dx,dy
    initstr = 'type=raw events\ncount=10\nspeed=1.0\nstart data >>\nLaunchActivity(' + package + ',' + activity + ')\nUserWait(20000)\n'
    #monkeyfile = open('D:\\UserProfiles\\YorickYe\\Desktop\\monkey123.txt', 'w+')
    monkeyfile = open(fileName,'w+')
    monkeyfile.write(initstr)
    #测试代码：
    # ClickMonkey(dx,dy,ax,ay).clickdpi(6, 18)
    # ClickMonkey(1960,1080,2560,1440).clickdpi(6,18)
    #创建事件百分比
    randomEven = []
    for i in range(0, 85):
        randomEven.append('click')
    for i in range(0, 10):
        randomEven.append('slip')
    for i in range(0, 5):
        randomEven.append('back')

    slipEven = 'Drag(480,540,960,540,1)\n'
    backEven = 'DispatchPress(KEYCODE_BACK)\n'

    #First step
    for i in range(1,1000):
        # firstStep.append([random.randint(373, 1100), random.randint(376, 545)])
        randomX1 = 60
        randomX2 = 1800
        randomY1 = 60
        randomY2 = 1000
        xy = ClickMonkey(dx,dy,ax,ay).clickdpi(random.randint(FirstX1, FirstX2),random.randint(FirstY1, FirstY2))
        clickEven = 'Tap' + str(xy) + '\n'
        if (random.choice(randomEven) == 'click'):
            monkeyfile.write(clickEven)
        elif (random.choice(randomEven) == 'slip'):
            monkeyfile.write(slipEven)
        elif (random.choice(randomEven) == 'back'):
            monkeyfile.write(backEven)
        else:
            monkeyfile.write(clickEven)





    # #Second Step
    # monkeyfile.write(backEven)
    # for i in range(1, 100):
    #     # firstStep.append([random.randint(373, 1100), random.randint(376, 545)])
    #     randomX1 = 420
    #     randomX2 = 1100
    #     randomY1 = 376
    #     randomY2 = 545
    #     xy = ClickMonkey(dx,dy,ax,ay).clickdpi(random.randint(randomX1, randomX2),random.randint(randomY1, randomY2))
    #     clickEven = 'Tap' + str(xy) + '\n'
    #     if (random.choice(randomEven) == 'click'):
    #         monkeyfile.write(clickEven)
    #     elif (random.choice(randomEven) == 'slip'):
    #         monkeyfile.write(slipEven)
    #     else:
    #         monkeyfile.write(clickEven)
    #
    # #Thirth Step
    # monkeyfile.write(backEven)
    # for i in range(1, 100):
    #     # firstStep.append([random.randint(373, 1100), random.randint(376, 545)])
    #     randomX1 = 420
    #     randomX2 = 1100
    #     randomY1 = 376
    #     randomY2 = 545
    #     xy =ClickMonkey(dx,dy,ax,ay).clickdpi(random.randint(randomX1, randomX2),random.randint(randomY1, randomY2))
    #     clickEven = 'Tap' + str(xy) + '\n'
    #     if (random.choice(randomEven) == 'click'):
    #         monkeyfile.write(clickEven)
    #     elif (random.choice(randomEven) == 'slip'):
    #         monkeyfile.write(slipEven)
    #     else:
    #         monkeyfile.write(clickEven)