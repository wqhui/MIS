# MIS

数据库介绍
------- 
![数据库](https://github.com/DeathKL/MIS/blob/master/%E4%BD%9C%E4%B8%9A3%EF%BC%88%E8%AE%BE%E5%A4%87%E4%BF%9D%E4%BF%AE%EF%BC%89/ER%E5%9B%BE.png)
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
![数据库](https://github.com/DeathKL/MIS/blob/master/%E4%BD%9C%E4%B8%9A3%EF%BC%88%E8%AE%BE%E5%A4%87%E4%BF%9D%E4%BF%AE%EF%BC%89/ER%E5%9B%BE.png)
