# MIS

SQL查询语句
------- 
#####1.根据test1的用户ID和user表，查询对order中的sys_button的权限
######逻辑过程
    IF 用户名=test1 存在 then
    	do	查询ID
    		根据ID和用户名查询用户对order中的sys_button的权限
    else
    	do  结束查询
######SQL语句
    /*根据test1的用户ID和user表，查询对order中的sys_button的权限*/
    SELECT * FROM sys_button
    WHERE sys_button.BtnID IN
    (SELECT cf_privilege.PrivilegeAccessKey FROM cf_privilege
		WHERE cf_privilege.PrivilegeMaster='CF_User'
		AND cf_privilege.PrivilegeMasterKey=
		(SELECT cf_user.UserID FROM cf_user
					WHERE cf_user.LoginName='test1')
		AND cf_privilege.PrivilegeAccess='Sys_Button'
		AND cf_privilege.PrivilegeOperation='Permit'
		)
![u-1](https://github.com/DeathKL/MIS/blob/master/Work6/u-1.png)

#####2.根据test1的用户ID和user表，查询对Sys_menu的权限
######思路
    IF 用户名=test1 存在 then
    	do	查询ID
    		根据ID和用户名查询用户对查询对Sys_menu的权限
    else
    	do  结束查询	
######SQL语句
    /*根据test1的用户ID和user表，查询对Sys_menu的权限*/
    SELECT * FROM sys_menu
    WHERE sys_menu.MenuID IN
    (SELECT cf_privilege.PrivilegeAccessKey FROM cf_privilege
		WHERE cf_privilege.PrivilegeMaster='CF_User'
		AND cf_privilege.PrivilegeMasterKey=
		(SELECT cf_user.UserID FROM cf_user
					WHERE cf_user.LoginName='test1')
		AND cf_privilege.PrivilegeAccess='Sys_Menu'
		AND cf_privilege.PrivilegeOperation='Permit'
		)

![u-2](https://github.com/DeathKL/MIS/blob/master/Work6/u-2.png)

#####3.根据test1的角色ID和角色表，查询对Sys_menu的权限
######思路
     IF 用户名=test1 存在 then
    	do	查询ID
    		根据ID和用户名查询用户的角色ID
			根据角色ID和角色表查询用户对Sys_menu的权限
    else
    	do  结束查询
######SQL语句
    /*根据test1的角色ID和角色表，查询对Sys_menu的权限*/
    SELECT * FROM sys_menu
    WHERE sys_menu.MenuID IN
    (SELECT cf_privilege.PrivilegeAccessKey FROM cf_privilege
    WHERE cf_privilege.PrivilegeMaster='CF_Role'
    AND cf_privilege.PrivilegeMasterKey=
        (SELECT cf_userrole.RoleID FROM cf_userrole
            WHERE cf_userrole.UserID =
                    (SELECT cf_user.UserID FROM cf_user
                    WHERE cf_user.LoginName='test1')
        )
    AND cf_privilege.PrivilegeAccess='Sys_Menu'
    AND cf_privilege.PrivilegeOperation='Permit')

![r-1](https://github.com/DeathKL/MIS/blob/master/Work6/r-1.png)

#####4.根据test1的角色ID和角色表，查询对order中的sys_button的权限
######思路
    IF 用户名=test1 存在 then
    	do	查询ID
    		根据ID和用户名查询用户的角色ID
			根据角色ID和角色表查询用户对order中的sys_button的权限		
    else
    	do  结束查询
######SQL语句
    /*根据test1的角色ID和角色表，查询对order中的sys_button的权限*/
    SELECT * FROM sys_button
    WHERE sys_button.BtnID IN
    (SELECT cf_privilege.PrivilegeAccessKey FROM cf_privilege
    WHERE cf_privilege.PrivilegeMaster='CF_Role'
    AND cf_privilege.PrivilegeMasterKey=
        (SELECT cf_userrole.RoleID FROM cf_userrole
            WHERE cf_userrole.UserID =
                    (SELECT cf_user.UserID FROM cf_user
                    WHERE cf_user.LoginName='test1')
        )
    AND cf_privilege.PrivilegeAccess='Sys_Button'
    AND cf_privilege.PrivilegeOperation='Permit')

![r-2](https://github.com/DeathKL/MIS/blob/master/Work6/r-2.png)
