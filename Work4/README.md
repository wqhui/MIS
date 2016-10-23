# MIS
原型介绍
------- 
#####1.主页
![原型](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E5%8E%9F%E5%9E%8B%E9%A2%84%E8%A7%88%E4%B8%BB%E9%A1%B5.png)
#####2.设备详情
![原型](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E5%8E%9F%E5%9E%8B%E9%A2%84%E8%A7%88%E8%AE%BE%E5%A4%87%E8%AF%A6%E6%83%85.png)
#####3.录入信息
![原型](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E5%8E%9F%E5%9E%8B%E9%A2%84%E8%A7%88%E8%AE%BE%E5%A4%87%E5%BD%95%E5%85%A5.png)
#####4.保修详情
![原型](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E5%8E%9F%E5%9E%8B%E9%A2%84%E8%A7%88%E8%AE%BE%E5%A4%87%E4%BF%9D%E5%85%BB%E8%AF%A6%E6%83%85.png)
#####5.打印页面
![原型](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E5%8E%9F%E5%9E%8B%E9%A2%84%E8%A7%88%E6%89%93%E5%8D%B0.png)

数据库介绍
------- 
![数据库](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/ER%E5%9B%BE.png)
#####1.equ_type表（设备类别表)
    ET_id
    ET_name（设备类型名字)
#####2.equ_content表（设备修理内容表）
    EC_id
    ET_id  （设备类别表ID）
    EC_content （设备修理内容）
#####3.Equiment表（设备表）
    Eid  自增长主键
    Enumber 设备型号
    ET_id（设备类别表ID）
#####4.Check_Detail表（保修详情表）
    CD_id  自增长主键
    CD_group 小组名
    CD_person 检修人
    CD_type  检查类型（年检）
    CD_time  检查时间
    CD_explain 说明
    Eid			（设备表）外键
    CD_circle		年检之类的时间（年检填365）
#####5.Check_Type（保修内容表）
    CT_id   		自增长主键
    CT_content	检修内容
    CT_situaction  检修情况
    CT_note  备注
    Eid		（设备表）外键
    CD_id		 （保修详情表）外键	
#####6.Check_consume（保修消耗表）
    CC_id  		自增长主键
    CD_id			（保修详情表）外键
    Eid			（设备表）外键
    CC_material	 消耗材料名字
    CC_quantity	 消耗材料数量

SQL语句
------- 
#####1.查询保修信息
    /*根据设备号查询保修信息*/
    /*（详情图1）*/
    select * from equipment,check_detail,check_type,check_consume
    where 
	    equipment.Eid=(SELECT Eid from equipment where equipment.Enumber="1001")    	
    and
	    check_detail.Eid = (SELECT Eid from equipment where equipment.Enumber="1001")
    and
	    check_type.Eid = (SELECT Eid from equipment where equipment.Enumber="1001")
    and
	    check_consume.Eid = (SELECT Eid from equipment where equipment.Enumber="1001") 
    and
	    check_detail.CD_id=check_type.CD_id  /*详情表和内容表ID一致（详情表ID）*/
    /*（详情图2）*/     
    /* 查看消耗品 内容表和消耗表ID一致（详情表ID） 删除中间下方的注释即可*/          
    /*  
    and
	    check_detail.CD_id=check_consume.CD_id  
    */  
    /*详情表和消耗表ID一致（详情表ID）*/ 
    /*（详情图3）*/ 
    /* 查看某一时间的保修详情  删除下方中间的注释即可*/           
    /*
    and
	    CD_time='2015-10-11' 
    */
详情图1    
![数据库](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E6%9F%A5%E8%AF%A2%E4%BF%9D%E5%85%BB%E8%AF%A6%E6%83%851.png "详情图1")
详情图2  
![数据库](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E6%9F%A5%E8%AF%A2%E4%BF%9D%E5%85%BB%E8%AF%A6%E6%83%852.png "详情图2")
详情图3
![数据库](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E6%9F%A5%E8%AF%A2%E4%BF%9D%E5%85%BB%E8%AF%A6%E6%83%853.png "详情图3")

#####2.信息录入
    /*保养信息录入 需要修改内容，否则重复*/
    /*填写保养人员等详细*/
    INSERT INTO `cart`.`check_detail` (`CD_group`, `CD_person`, `CD_type`, `CD_time`, `Eid`) VALUES ('风组', '小小风', '半年检', '2016-       09-10', '5');
    /*填写保养内容*/
    INSERT INTO `cart`.`check_type` (`CT_content`, `CT_situaction`, `Eid`, `CD_id`) VALUES ('检查6000V接线盒内瓷瓶、端子；', '正常', '1',     '5');
    INSERT INTO `cart`.`check_type` (`CT_content`, `CT_situaction`, `CT_note`, `Eid`, `CD_id`) VALUES ('接线盒内卫生清洁；', '异常', '更换    接线盒', '1', '5');
    INSERT INTO `cart`.`check_type` (`CT_content`, `CT_situaction`, `Eid`, `CD_id`) VALUES ('电机上是否有杂物，多要通知工艺处理。', '正常',     '2', '6');
    INSERT INTO `cart`.`check_type` (`CT_content`, `CT_situaction`, `Eid`, `CD_id`) VALUES ('电机接地线连接是否可靠；', '正常', '2', '6');
![数据库](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E8%AE%BE%E5%A4%87%E5%BD%95%E5%85%A5.png)
#####3.预警信息
    /*预警信息*/
    select *
    from equipment,(select check_detail.Eid,check_detail.CD_circle,max(check_detail.CD_time) as timee from check_detail group by             check_detail.Eid) AS T
    where T.Eid=equipment.Eid 
    and 
	    (T.CD_circle - DATEDIFF(now(),T.timee)) <4    
    group by equipment.Eid
![数据库](https://github.com/DeathKL/MIS/blob/master/Work3(Equipment%20warranty)/%E9%A2%84%E8%AD%A6%E4%BF%A1%E6%81%AF.png)           	   

