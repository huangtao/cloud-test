-- Description:各个状态的配置
-- Note:
--		程序使用StateMachine这个类，该类负责场景状态的切换，而切换的时候
-- 程序会查看系统维护的状态的集合，如果当前的状态不存在，那么以状态为索引
-- 到table----StatesMap中去获得状态，从而创建。所以，程序需要创建table,配置
-- state

States = 
{
	HolidaysBg          = 1,--闪屏
};

StatesMap = 
{
	[States.HolidaysBg] = {"hall/holidaysBg/holidaysBgState", "HolidaysBgState"},
};
