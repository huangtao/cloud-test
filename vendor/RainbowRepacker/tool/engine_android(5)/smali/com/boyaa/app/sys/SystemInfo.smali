.class public Lcom/boyaa/app/sys/SystemInfo;
.super Ljava/lang/Object;
.source "SystemInfo.java"


# static fields
.field private static final DICT_KEY_APKINSTALLTIME:Ljava/lang/String; = "apkInstallTime"

.field private static final DICT_KEY_APK_MD5:Ljava/lang/String; = "apk_md5"

.field private static final DICT_KEY_APP_VERSION_CODE:Ljava/lang/String; = "app_version_code"

.field private static final DICT_KEY_APP_VERSION_NAME:Ljava/lang/String; = "app_version_name"

.field private static final DICT_KEY_DEVICE_ID:Ljava/lang/String; = "device_id"

.field private static final DICT_KEY_MAC:Ljava/lang/String; = "mac"

.field private static final DICT_KEY_MANUFACTURER:Ljava/lang/String; = "manufacturer"

.field private static final DICT_KEY_NETWORK_AVALIBLE:Ljava/lang/String; = "network_avalible"

.field private static final DICT_KEY_NETWORK_TYPE:Ljava/lang/String; = "network_type"

.field private static final DICT_KEY_PHONE_MODEL:Ljava/lang/String; = "phone_model"

.field private static final DICT_KEY_SDK_VERSION:Ljava/lang/String; = "sdk_version"

.field private static final DICT_NAME:Ljava/lang/String; = "TerminalInfoTable"

.field public static LOG_TAG:Ljava/lang/String;

.field public static versionCode:I

.field public static versionName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-string v0, "SystemInfo"

    sput-object v0, Lcom/boyaa/app/sys/SystemInfo;->LOG_TAG:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/app/sys/SystemInfo;->versionCode:I

    .line 45
    const-string v0, ""

    sput-object v0, Lcom/boyaa/app/sys/SystemInfo;->versionName:Ljava/lang/String;

    .line 331
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static LocalInfo(Landroid/app/Activity;)Ljava/lang/String;
    .locals 26
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 122
    const-string v18, ""

    .line 124
    .local v18, "result":Ljava/lang/String;
    :try_start_0
    sget-object v15, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 125
    .local v15, "phoneModel":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/sys/SystemInfo;->getVersionName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v23

    .line 126
    .local v23, "versionName":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/util/ToolKit;->getUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v21

    .line 127
    .local v21, "uuid":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/sys/SystemInfo;->onGetDeviceId(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v7

    .line 128
    .local v7, "deviceId":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/sys/SystemInfo;->onGetMachineId(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v13

    .line 129
    .local v13, "macAdress":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/sys/SystemInfo;->getAndroidId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "androidId":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getPhoneNumbers()Ljava/lang/String;

    move-result-object v16

    .line 131
    .local v16, "phoneNum":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getSimType()I

    move-result v20

    .line 132
    .local v20, "simType":I
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getImsi()Ljava/lang/String;

    move-result-object v11

    .line 133
    .local v11, "imsi":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getImei()Ljava/lang/String;

    move-result-object v10

    .line 134
    .local v10, "imei":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/util/SimUtil;->getIccid()Ljava/lang/String;

    move-result-object v9

    .line 135
    .local v9, "iccid":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/util/NetworkUtil;->getNetworkType(Landroid/content/Context;)I

    move-result v14

    .line 136
    .local v14, "networkType":I
    sget-object v17, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 137
    .local v17, "releaseVer":Ljava/lang/String;
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 138
    .local v19, "sdkVer":I
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/sys/SystemInfo;->getVersionCode(Landroid/app/Activity;)I

    move-result v22

    .line 139
    .local v22, "verCode":I
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/boyaa/app/sys/SystemInfo;->getChannelData(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v4

    .line 140
    .local v4, "channelData":[Ljava/lang/String;
    if-nez v4, :cond_0

    .line 141
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v4, v0, [Ljava/lang/String;

    .end local v4    # "channelData":[Ljava/lang/String;
    const/16 v24, 0x0

    const-string v25, ""

    aput-object v25, v4, v24

    const/16 v24, 0x1

    const-string v25, ""

    aput-object v25, v4, v24

    const/16 v24, 0x2

    const-string v25, ""

    aput-object v25, v4, v24

    .line 143
    .restart local v4    # "channelData":[Ljava/lang/String;
    :cond_0
    const/16 v24, 0x0

    aget-object v3, v4, v24

    .line 144
    .local v3, "appid":Ljava/lang/String;
    const/16 v24, 0x1

    aget-object v5, v4, v24

    .line 145
    .local v5, "channelId":Ljava/lang/String;
    const/16 v24, 0x2

    aget-object v6, v4, v24

    .line 147
    .local v6, "channelKey":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v24

    if-eqz v24, :cond_1

    .line 148
    if-nez v13, :cond_f

    const-string v7, ""

    .line 155
    :cond_1
    :goto_0
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 156
    .local v12, "jo":Lorg/json/JSONObject;
    const-string v24, "phoneModel"

    if-nez v15, :cond_2

    const-string v15, ""

    .end local v15    # "phoneModel":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    const-string v24, "versionName"

    if-nez v23, :cond_3

    const-string v23, ""

    .end local v23    # "versionName":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    const-string v24, "uuid"

    if-nez v21, :cond_4

    const-string v21, ""

    .end local v21    # "uuid":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 159
    const-string v24, "deviceId"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    const-string v24, "machineId"

    if-nez v13, :cond_5

    const-string v13, ""

    .end local v13    # "macAdress":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 161
    const-string v24, "androidid"

    if-nez v2, :cond_6

    const-string v2, ""

    .end local v2    # "androidId":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 162
    const-string v24, "phoneNum"

    if-nez v16, :cond_7

    const-string v16, ""

    .end local v16    # "phoneNum":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    const-string v24, "phoneCardType"

    move-object/from16 v0, v24

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 164
    const-string v24, "imsi"

    if-nez v11, :cond_8

    const-string v11, ""

    .end local v11    # "imsi":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    const-string v24, "imei"

    if-nez v10, :cond_9

    const-string v10, ""

    .end local v10    # "imei":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    const-string v24, "iccid"

    if-nez v9, :cond_a

    const-string v9, ""

    .end local v9    # "iccid":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 167
    const-string v24, "networkType"

    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 168
    const-string v24, "releaseVersion"

    if-nez v17, :cond_b

    const-string v17, ""

    .end local v17    # "releaseVer":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    const-string v24, "sdkVersion"

    move-object/from16 v0, v24

    move/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 170
    const-string v24, "versionCode"

    move-object/from16 v0, v24

    move/from16 v1, v22

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 172
    const-string v24, "appid"

    if-nez v3, :cond_c

    const-string v3, ""

    .end local v3    # "appid":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 173
    const-string v24, "channel_id"

    if-nez v5, :cond_d

    const-string v5, ""

    .end local v5    # "channelId":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 174
    const-string v24, "channel_key"

    if-nez v6, :cond_e

    const-string v6, ""

    .end local v6    # "channelKey":Ljava/lang/String;
    :cond_e
    move-object/from16 v0, v24

    invoke-virtual {v12, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 184
    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v18

    .line 190
    .end local v4    # "channelData":[Ljava/lang/String;
    .end local v7    # "deviceId":Ljava/lang/String;
    .end local v12    # "jo":Lorg/json/JSONObject;
    .end local v14    # "networkType":I
    .end local v19    # "sdkVer":I
    .end local v20    # "simType":I
    .end local v22    # "verCode":I
    :goto_1
    return-object v18

    .restart local v2    # "androidId":Ljava/lang/String;
    .restart local v3    # "appid":Ljava/lang/String;
    .restart local v4    # "channelData":[Ljava/lang/String;
    .restart local v5    # "channelId":Ljava/lang/String;
    .restart local v6    # "channelKey":Ljava/lang/String;
    .restart local v7    # "deviceId":Ljava/lang/String;
    .restart local v9    # "iccid":Ljava/lang/String;
    .restart local v10    # "imei":Ljava/lang/String;
    .restart local v11    # "imsi":Ljava/lang/String;
    .restart local v13    # "macAdress":Ljava/lang/String;
    .restart local v14    # "networkType":I
    .restart local v15    # "phoneModel":Ljava/lang/String;
    .restart local v16    # "phoneNum":Ljava/lang/String;
    .restart local v17    # "releaseVer":Ljava/lang/String;
    .restart local v19    # "sdkVer":I
    .restart local v20    # "simType":I
    .restart local v21    # "uuid":Ljava/lang/String;
    .restart local v22    # "verCode":I
    .restart local v23    # "versionName":Ljava/lang/String;
    :cond_f
    move-object v7, v13

    .line 148
    goto/16 :goto_0

    .line 185
    .end local v2    # "androidId":Ljava/lang/String;
    .end local v3    # "appid":Ljava/lang/String;
    .end local v4    # "channelData":[Ljava/lang/String;
    .end local v5    # "channelId":Ljava/lang/String;
    .end local v6    # "channelKey":Ljava/lang/String;
    .end local v7    # "deviceId":Ljava/lang/String;
    .end local v9    # "iccid":Ljava/lang/String;
    .end local v10    # "imei":Ljava/lang/String;
    .end local v11    # "imsi":Ljava/lang/String;
    .end local v13    # "macAdress":Ljava/lang/String;
    .end local v14    # "networkType":I
    .end local v15    # "phoneModel":Ljava/lang/String;
    .end local v16    # "phoneNum":Ljava/lang/String;
    .end local v17    # "releaseVer":Ljava/lang/String;
    .end local v19    # "sdkVer":I
    .end local v20    # "simType":I
    .end local v21    # "uuid":Ljava/lang/String;
    .end local v22    # "verCode":I
    .end local v23    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 187
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public static getAndroidId(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 280
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 281
    .local v0, "aid":Ljava/lang/String;
    return-object v0
.end method

.method public static getApkInstallTime()V
    .locals 7

    .prologue
    .line 343
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v4, "apkInstallInfo"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 344
    .local v0, "apkInstallInfo":Landroid/content/SharedPreferences;
    const-string v3, "apkInstallTime"

    const-wide/16 v4, 0x0

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long v1, v3, v5

    .line 345
    .local v1, "time":J
    const-string v3, "TerminalInfoTable"

    const-string v4, "apkInstallTime"

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    return-void
.end method

.method public static getApkMd5()V
    .locals 12

    .prologue
    .line 352
    const-string v9, "TerminalInfoTable"

    const-string v10, "apk_md5"

    invoke-static {v9, v10}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 353
    .local v7, "md5":Ljava/lang/String;
    const-string v9, "TerminalInfoTable"

    const-string v10, "app_version_name"

    invoke-static {v9, v10}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 354
    .local v6, "lastVersionName":Ljava/lang/String;
    const-string v9, "TerminalInfoTable"

    const-string v10, "app_version_code"

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    .line 356
    .local v5, "lastVersionCode":I
    sget-object v9, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v9}, Lcom/boyaa/app/sys/SystemInfo;->getVersionName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v2

    .line 357
    .local v2, "curVersionName":Ljava/lang/String;
    sget-object v9, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v9}, Lcom/boyaa/app/sys/SystemInfo;->getVersionCode(Landroid/app/Activity;)I

    move-result v1

    .line 359
    .local v1, "curVersionCode":I
    const-string v9, "getApkMd5"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "curVersionName = "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " curVersionCode =  "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " md5 = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    if-eqz v7, :cond_0

    const-string v9, ""

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    if-ne v1, v5, :cond_0

    .line 376
    :goto_0
    return-void

    .line 363
    :cond_0
    sget-object v9, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v9}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 364
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageResourcePath()Ljava/lang/String;

    move-result-object v8

    .line 365
    .local v8, "path":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 367
    .local v4, "file":Ljava/io/File;
    :try_start_0
    invoke-static {v4}, Lcom/boyaa/util/MD5Util;->getFileMD5String(Ljava/io/File;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 373
    :goto_1
    const-string v9, "TerminalInfoTable"

    const-string v10, "app_version_name"

    invoke-static {v9, v10, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    const-string v9, "TerminalInfoTable"

    const-string v10, "app_version_code"

    invoke-static {v9, v10, v1}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 375
    const-string v9, "TerminalInfoTable"

    const-string v10, "apk_md5"

    invoke-static {v9, v10, v7}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 368
    :catch_0
    move-exception v3

    .line 369
    .local v3, "e":Ljava/lang/Exception;
    const-string v7, ""

    .line 370
    const-string v9, "gaojie"

    const-string v10, "getApkMd5 exception !!!"

    invoke-static {v9, v10}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static getChannelData(Landroid/content/Context;)[Ljava/lang/String;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x1

    .line 287
    const/4 v2, 0x0

    .line 289
    .local v2, "data":[Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 290
    .local v6, "packageName":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const/16 v8, 0x80

    invoke-virtual {v7, v6, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 291
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v7, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v7, :cond_0

    .line 293
    iget-object v7, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v8, "CHANNEL"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, "channelData":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 297
    const-string v7, ";"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 298
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, v2
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v4, v7, :cond_2

    .line 309
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "channelData":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v6    # "packageName":Ljava/lang/String;
    :cond_0
    :goto_1
    if-nez v2, :cond_1

    .line 311
    const/4 v7, 0x3

    new-array v2, v7, [Ljava/lang/String;

    .end local v2    # "data":[Ljava/lang/String;
    const/4 v7, 0x0

    const-string v8, ""

    aput-object v8, v2, v7

    const-string v7, ""

    aput-object v7, v2, v9

    const/4 v7, 0x2

    const-string v8, ""

    aput-object v8, v2, v7

    .line 314
    .restart local v2    # "data":[Ljava/lang/String;
    :cond_1
    return-object v2

    .line 300
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v1    # "channelData":Ljava/lang/String;
    .restart local v4    # "i":I
    .restart local v6    # "packageName":Ljava/lang/String;
    :cond_2
    :try_start_1
    aget-object v7, v2, v4

    const-string v8, "="

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 301
    .local v5, "kv":[Ljava/lang/String;
    const/4 v7, 0x1

    aget-object v7, v5, v7

    aput-object v7, v2, v4
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 298
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 305
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "channelData":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "kv":[Ljava/lang/String;
    .end local v6    # "packageName":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 306
    .local v3, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v3}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1
.end method

.method public static getLocalMacAddress(Landroid/app/Activity;)Ljava/lang/String;
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 431
    const-string v3, "wifi"

    invoke-virtual {p0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 432
    .local v2, "manager":Landroid/net/wifi/WifiManager;
    if-eqz v2, :cond_0

    .line 433
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 434
    .local v0, "info":Landroid/net/wifi/WifiInfo;
    if-eqz v0, :cond_0

    .line 435
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    .line 436
    .local v1, "mac":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 441
    .end local v0    # "info":Landroid/net/wifi/WifiInfo;
    .end local v1    # "mac":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method public static getLocalMacAddressForLua(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 407
    invoke-static {p0}, Lcom/boyaa/app/sys/SystemInfo;->getLocalMacAddress(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    .line 408
    .local v0, "mac":Ljava/lang/String;
    const-string v1, "TerminalInfoTable"

    const-string v2, "mac"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    return-void
.end method

.method public static getNetWorkTypeForLua(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 412
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/boyaa/util/NetworkUtil;->getNetworkType(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, "networkType":Ljava/lang/String;
    const-string v1, "TerminalInfoTable"

    const-string v2, "network_type"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    return-void
.end method

.method public static getVersionCode(Landroid/app/Activity;)I
    .locals 7
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 263
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 266
    .local v2, "packageManager":Landroid/content/pm/PackageManager;
    const/4 v3, -0x1

    .line 269
    .local v3, "version":I
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    .line 268
    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 270
    .local v1, "packInfo":Landroid/content/pm/PackageInfo;
    iget v3, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    .end local v1    # "packInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return v3

    .line 271
    :catch_0
    move-exception v0

    .line 272
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v4, Lcom/boyaa/app/sys/SystemInfo;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "localInfo:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getVersionName(Landroid/app/Activity;)Ljava/lang/String;
    .locals 7
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 241
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 244
    .local v2, "packageManager":Landroid/content/pm/PackageManager;
    const-string v3, ""

    .line 247
    .local v3, "version":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    .line 246
    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 248
    .local v1, "packInfo":Landroid/content/pm/PackageInfo;
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v1    # "packInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v3

    .line 249
    :catch_0
    move-exception v0

    .line 250
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v4, Lcom/boyaa/app/sys/SystemInfo;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "localInfo:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static initLocalInfoForLua(Landroid/app/Activity;)V
    .locals 8
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 381
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 382
    .local v2, "phoneModel":Ljava/lang/String;
    const-string v6, "TerminalInfoTable"

    const-string v7, "phone_model"

    invoke-static {v6, v7, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    invoke-static {p0}, Lcom/boyaa/app/sys/SystemInfo;->onGetDeviceId(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    .line 385
    .local v0, "deviceId":Ljava/lang/String;
    const-string v6, "TerminalInfoTable"

    const-string v7, "device_id"

    invoke-static {v6, v7, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 390
    .local v3, "sdkVersion":Ljava/lang/String;
    const-string v6, "TerminalInfoTable"

    const-string v7, "sdk_version"

    invoke-static {v6, v7, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    invoke-static {p0}, Lcom/boyaa/app/sys/SystemInfo;->getVersionName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v5

    .line 393
    .local v5, "versionName":Ljava/lang/String;
    const-string v6, "TerminalInfoTable"

    const-string v7, "app_version_name"

    invoke-static {v6, v7, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/boyaa/app/sys/SystemInfo;->getVersionCode(Landroid/app/Activity;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 397
    .local v4, "versionCode":Ljava/lang/String;
    const-string v6, "TerminalInfoTable"

    const-string v7, "app_version_code"

    invoke-static {v6, v7, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 403
    .local v1, "manufacturer":Ljava/lang/String;
    const-string v6, "TerminalInfoTable"

    const-string v7, "manufacturer"

    invoke-static {v6, v7, v1}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 404
    return-void
.end method

.method public static isNetWorkAvalible(Landroid/app/Activity;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 417
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->isActiveNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    .line 418
    .local v0, "isActiveNetworkAvailable":Z
    invoke-static {p0}, Lcom/boyaa/engine/made/APNUtil;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v1

    .line 419
    .local v1, "isNetworkAvailable":Z
    const/4 v2, 0x0

    .line 420
    .local v2, "result":I
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 421
    const/4 v2, 0x1

    .line 423
    :cond_0
    const-string v3, "TerminalInfoTable"

    const-string v4, "network_avalible"

    invoke-static {v3, v4, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 424
    return-void
.end method

.method public static onGetDeviceId(Landroid/app/Activity;)Ljava/lang/String;
    .locals 4
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 67
    const-string v0, ""

    .line 69
    .local v0, "deviceId":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 68
    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 70
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    if-eqz v1, :cond_0

    .line 71
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 72
    if-nez v0, :cond_0

    .line 74
    const-string v0, ""

    .line 77
    :cond_0
    return-object v0
.end method

.method public static onGetDeviceId(Landroid/app/Activity;Z)Ljava/lang/String;
    .locals 4
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "isJosn"    # Z

    .prologue
    .line 84
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 85
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "deviceId"

    invoke-static {p0}, Lcom/boyaa/app/sys/SystemInfo;->onGetDeviceId(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 87
    .local v0, "json":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static onGetMachineId(Landroid/app/Activity;)Ljava/lang/String;
    .locals 5
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 94
    const-string v0, ""

    .line 95
    .local v0, "machineId":Ljava/lang/String;
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v3

    .line 96
    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 95
    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 97
    .local v1, "mgr":Landroid/net/wifi/WifiManager;
    if-eqz v1, :cond_0

    .line 98
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 99
    .local v2, "wifiinfo":Landroid/net/wifi/WifiInfo;
    if-eqz v2, :cond_0

    .line 100
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v0

    .line 103
    .end local v2    # "wifiinfo":Landroid/net/wifi/WifiInfo;
    :cond_0
    return-object v0
.end method

.method public static onGetMachineId(Landroid/app/Activity;Z)Ljava/lang/String;
    .locals 4
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "isJosn"    # Z

    .prologue
    .line 111
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 112
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "machineId"

    invoke-static {p0}, Lcom/boyaa/app/sys/SystemInfo;->onGetMachineId(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 114
    .local v0, "json":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static setApkInstallTime()V
    .locals 5

    .prologue
    .line 335
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v3, "apkInstallInfo"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 336
    .local v0, "apkInstallInfo":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 337
    .local v1, "apkInstallInfoEditor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "apkInstallTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 338
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 339
    return-void
.end method


# virtual methods
.method public setVersion()V
    .locals 4

    .prologue
    .line 48
    const-string v0, "Version_sync"

    const-string v1, "versionCode"

    new-instance v2, Ljava/lang/StringBuilder;

    sget v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->versionCode:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    const-string v0, "Version_sync"

    const-string v1, "versionName"

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->versionName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    return-void
.end method

.method public updateVersion(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 56
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 57
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 58
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 59
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1, v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->startActivity(Landroid/content/Intent;)V

    .line 60
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->finish()V

    .line 61
    return-void
.end method
