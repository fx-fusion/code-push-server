```sh
# 使用私有服务
code-push-yx link http://your-local-ip:3000
# 注册
code-push-yx register
# 登录
code-push-yx login xxxxx

# 添加应用平台 
code-push-yx app add <app_name> <os> <platform>
# 例如添加iOS平台 
code-push-yx app add iOSRNHybrid ios react-native,多个平台执行多次
# 查看应用列表 
code-push-yx app list 
# 添加部署环境 
code-push-yx deployment add <app_name> test//创建test环境
# 查看APP的环境信息 
code-push-yx deployment list <app_name> --format json

# 发布
code-push-yx release-react mishu android -m true -d Production --des "发布" -t "1.0.0"

```

