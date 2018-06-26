-- function  FirstMethod( ... )
-- 	-- body
-- 	print("FirstMethod Hello world")
-- end
-- FirstMethod()

--从左到右赋值，不足的用nil补充,多余的省略
-- num,num2=1,2
-- print(num,num2)
--算数运算符
--[[+、－、＊、／、^、--]]
--关系运算符
--[[<、>、==、~=、<=、>= --]]
--逻辑运算符
--[[and、or、not--]]


--and :与
-- print(1 and 2)
-- 操作数1与操作数2相与，
-- 如果操作数1为真，返回操作数2，整个表达式结果
-- 取决于操作数2，
-- 如果操作数1为假，直接返回操作数，整个表达式结果为假


--or :或
-- print(nil or 2)
-- 操作数1与操作数2相或，
-- 如果操作数1为真，返回操作数1，整个表达式结果为真
-- 如果操作数1为假，直接返回操作数2，整个表达式结果
-- 取决于操作数1


-- not: 非
--false\true，取反
-- print(not 1)


-- if conditions then
-- 	--todo
-- elseif
-- 	--todo
-- else
-- --todo
-- end


-- for i=1,10 do
-- 	print(i)
-- end


-- count = 1
-- while count<=20 do
-- 	--todo
-- 	count = count + 2
-- 	print(count)
-- end

-- count = 11
-- repeat
-- 	--todo
-- 	count = count +1
-- 	print(count)
-- 	until count>10;

--Lua Table
--表，可以用来模仿容器（数组，列表，map, Vector，字典），
--也可以用于结构体，枚举
--模拟类以及模拟编程语言面向对象思想

--表的索引从1开始
--定义以及初始化
-- tab = {}--空表
--索引初始化
-- tab[1]="Mon"
-- tab[2]="Thues"

--定义同时初始化
-- tab = {"Mon","Thuest"}
-- print(tab[2])


-- tab = {mon="Jan",thu = "Fri"}
-- print(tab["mon"])
-- print(tab.mon)


-- tab4 = {mon = "Jan",12,3,4,"HHHHHHH",123,nil,456}
-- for i,v in ipairs(tab4) do
-- 	print(i,v)
-- end

-- for k,v in pairs(tab4) do
-- 	print(k,v)
-- end



--#:计算表的长度，不准确（如果表中有键值对或nil）
-- print(#tab4)


-- TableEnum = {
-- 	Mon=1,
-- 	Thues=2,
-- }

--[[Lua 基础进阶--]]
--深入Lua程序设计


--1、闭合函数
--包含非局部变量的函数

--非局部变量：相对于一个函数是局部变量，相对于另外一个函数是全局变量
--对于闭合函数而言,属于它的非局部变量,并不是在调用它的时候临时产生的,
--而是和它一 起存在的。所以每次调用闭合函数,非局部变量的值都不会被重置。
--eg:


-- function NotGlobalMethod()
-- 	-- body
-- 	local x = 1
-- 	return function ()
-- 		-- body
-- 		x=x+1
-- 		return x
-- 	end
-- end
-- local  a = NotGlobalMethod()
-- print(a())
-- print(a())
-- print(a())
-- print(a())

--2、非全局函数
--存储在局部变量中的函数
--好处：允许函数先调用，后声明

--eg:
-- local eat = nil
-- local drink = nil
-- eat = function ( )
-- 	-- body
-- 	print("Eating")
-- 	drink()
-- end
-- drink = function ()
-- 	-- body
-- 	print("Drinking")
-- end
-- eat()

--3、尾调用
--一个函数是另外一个函数的最后一段执行程序
--可以判断函数结束时机，一般用于状态机



--迭代器
-- function  dieDaiQi(t)
-- 	-- body
-- 	local i = 0
-- 	return function ()i=i+1
-- 	return t[i]
-- 		-- body
-- 	end
-- end

-- local iter = dieDaiQi(t)
-- while true do
-- 	local value = iter()
-- 	if value ==nil then break
-- 	end
-- 	print(value)
-- end

-- local t = {"asff","214"}
-- for value in dieDaiQi(t) do
-- 	print(value)
-- end

-- function dieDaiQi( t )
-- 	-- body
-- 	local i = 0
-- 	return function (  )
-- 		-- body
-- 		i=i+1
-- 		if i>#t then
-- 			return nil
-- 		end
-- 		return i,t[i]
-- 	end
-- end


--编译执行与错误
--捕捉错误

-- tab = {}
-- if	pcall(tab[1]) then
-- 	print("RIGHT")
-- else
-- 	tab[1] = 1
-- 	print("Wrong")
-- 	print(tab[1])
-- end

-- function Test( ... )
-- 	-- body
-- 	print(a[1])
-- end

-- local status, errorInfo = pcall(Test)
-- print(status,errorInfo)


--编译与执行
--loadfile(): 传递一个文件名，只编译，不执行
-- loadfile("Hello.lua")


--dofile():传递一个路径，即编译，也执行，且可以执行多次
-- dofile("./Hello.lua")
-- print(tab.name)
-- dofile("./Hello.lua")
-- dofile("./Hello.lua")

--require():传递一个模块名，在同一目录下，模块名就是文件名，但不用加路径，即编译，也执行，且只执行一次
-- require("Hello")
-- print(tab.age)

--协同程序
--状态:正常(normal)、运行(running)、挂起(suspended)、死亡(dead)

--coroutine.create()

-- local co = coroutine.create(function ()
-- 	-- body
-- 	local yieldRet = coroutine.yield("yieldParam")
-- 	print(yieldRet)
-- 	print("Creat a coroutine.create(f)")
-- 	return "zxcgasd"
-- end)

-- local status,errorInfo = coroutine.resume(co,"resumeParam1")
-- print(status,errorInfo)
-- print(coroutine.status(co))

-- local status,errorInfo = coroutine.resume(co,"resumeParam2")
-- print(status,errorInfo)
-- print(coroutine.status(co))


-- local co = coroutine.create(function ()
-- 	-- body
-- 	for i=1,2 do
-- 		print("你好，协同程序".. i)
-- 		coroutine.yield()
-- 	end
-- 	return "协同程序函数结束"
-- end)

-- coroutine.resume(co)
-- print(coroutine.status(co))
-- coroutine.resume(co)
-- print(coroutine.status(co))
-- coroutine.resume(co)
-- print(coroutine.status(co))

-- for i=1,3 do
-- 	print("========第"..i.."次执行：")
-- 	local result,msg = coroutine.resume(co,"resume param")
-- 	print("msg:"..msg)
-- end


--[[Lua 面向对象--]]

--Lua 元表与元方法
--元表：Lua中普通的表，定义了原始值在某些特定操作下的行为
--setmetatable：设置元表
--getmetatable：获取元表
--eg：
-- local tab = {}
-- local tab_mt = {}
-- local  ret = setmetatable(tab,tab_mt)
-- print(ret)
-- print(tab)
-- print(tab_mt)

-- local  ret_mt = getmetatable(tab)
-- print(ret_mt)

--元方法：元表中的键称为事件，元表中的值称为方法


--关系元方法
-- __eq:==
-- __lt:<
-- __le:<=


--算数元方法
-- __add:加  +
-- __sun:减  -
-- __mul:乘法 *
-- __div：除法 /
-- __unm： 取反 ~
-- __mod：取模
-- __pow：乘幂 ^


-- local mt ={
-- 	__add = function (  )
-- 		-- body
-- 		print("Add")
-- 	end
-- }
-- local  t1 = {}
-- local t2 = {}
-- setmetatable(t1,mt)
-- setmetatable(t2,mt)
-- local t=t1+t2

--规则：
--如果两个表具有不同的元表
--如果第一个表具有元表或元方法，则遵循第一个元表的元方法操作
--否则，遵循第二个表所对应的元表的元方法操作
--如果俩表都没油对应的元表盒元方法，则抛出异常


--特殊元方法
--__index:查询
--在访问表中不存在字段是允许程序员进行一些自定义的操作
--两种赋值方式：1、函数；2、表

-- local mt = {
--第一种方式：函数
	-- __index = function ( table,key )
	-- 	-- body
	-- 	print("key is invalid or is not exist")
	-- 	-- return 1
	-- end
-- 第二种方式：表
-- 	__index = {name = "GG",age = 12}
-- }

-- local  tab = {}
-- setmetatable(tab,mt)
-- print(tab.age)


--特性：
-- 如果__index赋值为函数，则在访问不存在字段时，将会回调该函数
-- 如果__index赋值为表，则在访问不存在字段时，将会向__index所对应的表中查询字段，并返回字段所对应的值


--__newindex：更新
--在访问不存在字段时，允许程序员进行一些自定义更新操作
--两种赋值方式：1、函数；2、表

--eg:
-- local newTab = {name = "HH",age = 12,sex="man"}
-- local mt = {
--函数
	-- __newindex =function ( table,key,value )
	-- 	-- body
	-- 	print(table,key,value)
	-- end
--表
-- 	__newindex = newTab
-- }
-- local tab = {}
-- setmetatable(tab,mt)
-- tab.name="JJ"
-- print(newTab.name)


--特性

-- 在访问不存在字段时，
-- 如果__newindex对应的是一个函数，则会回调该函数
-- 如果__newindex对应的是一个表，则将会更新__newindex对应表中字段的信息

--LUA全局环境
--  _G
-- gName = "GAME"
-- print(gName)
-- print(_G.gName)
-- print(_G["gName"])



--Lua  模块

-- require("game")
-- print(game.player)
-- game.play()




--Lua面向对象基础
--self:代表对象（表）本身
--.与:

-- 使用.运算符进行函数访问时，需要显示传递self参数
-- 使用:运算符进行函数访问时，不需要显示传递self参数，系统自动进行隐式传递

-- Person = {
-- 	name = nil,
-- 	age = 0
-- }
-- function Person.setName(self,strName )
-- 	-- body
-- 	self.name = strName
-- end
-- function Person:setAge( numAge )
-- 	-- body
-- 	self.age=numAge
-- end

-- Person.setName(Person,"asdsd")
-- print(Person.name)
-- Person:setAge(12)
-- print(Person.age)

--封装


--继承


Animal = {name = nil, age = 0}
function Animal:new( tab )

	-- body
	local tab = tab or {}
	setmetatable(tab,self)
	self.__index = self
	return tab
end

function Animal:setName( strName )
	-- body
	self.name = strName
end

Lion = Animal:new()
-- Lion:setName("KK")
-- print(Lion.name)
-- print(Animal.name)
function Lion:setAge( numAge )
	-- body
	self.age = numAge
end

-- function Lion:setAge(  )
-- 	-- body
-- 	print("age age")
-- end

function Lion:setName(  )
	-- body
	print("override")
end

Lion:setName()
Lion:setAge(12)
print(Lion.age)
print(Animal.age)


--多态



--Lua面向对象方法高级











