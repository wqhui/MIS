# MIS

数据库介绍
------- 
#####1.equ_type表（设备类别表)
  ET_id
  ET_name（设备类型名字)
#####2.equ_content表（设备修理内容表）
  EC_id
  ET_id  （设备类别表ID）
  EC_content （设备修理内容）
#####3.Equiment表（设备表）
* Eid  自增长主键
* Enumber 设备型号
* ET_id（设备类别表ID）
#####4Check_Detail表（保修详情表）
* CD_id  自增长主键
* CD_group 小组名
* CD_person 检修人
* CD_type  检查类型（年检）
* CD_time  检查时间
* CD_explain 说明
* Eid			（设备表）外键
* CD_circle		年检之类的时间（年检填365）
#####5Check_Type（保修内容表）
* CT_id   		自增长主键
* CT_content	检修内容
* CT_situaction  检修情况
* CT_note  备注
* Eid		（设备表）外键
* CD_id		 （保修详情表）外键	
#####6Check_consume（保修消耗表）
* CC_id  		自增长主键
* CD_id			（保修详情表）外键
* Eid			（设备表）外键
* CC_material	 消耗材料名字
* CC_quantity	 消耗材料数量


