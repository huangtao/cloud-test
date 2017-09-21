.class public Lcom/boyaa/entity/service/ServiceHelper;
.super Ljava/lang/Object;
.source "ServiceHelper.java"


# static fields
.field private static instance:Lcom/boyaa/entity/service/ServiceHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/entity/service/ServiceHelper;->instance:Lcom/boyaa/entity/service/ServiceHelper;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/service/ServiceHelper;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/boyaa/entity/service/ServiceHelper;->instance:Lcom/boyaa/entity/service/ServiceHelper;

    if-nez v0, :cond_0

    .line 22
    invoke-static {}, Lcom/boyaa/entity/service/ServiceHelper;->initInstance()V

    .line 24
    :cond_0
    sget-object v0, Lcom/boyaa/entity/service/ServiceHelper;->instance:Lcom/boyaa/entity/service/ServiceHelper;

    return-object v0
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 28
    const-class v1, Lcom/boyaa/entity/service/ServiceHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/entity/service/ServiceHelper;->instance:Lcom/boyaa/entity/service/ServiceHelper;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/boyaa/entity/service/ServiceHelper;

    invoke-direct {v0}, Lcom/boyaa/entity/service/ServiceHelper;-><init>()V

    sput-object v0, Lcom/boyaa/entity/service/ServiceHelper;->instance:Lcom/boyaa/entity/service/ServiceHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    :cond_0
    monitor-exit v1

    return-void

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public enter(Ljava/lang/String;)V
    .locals 27
    .param p1, "jsonStr"    # Ljava/lang/String;

    .prologue
    .line 81
    :try_start_0
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 82
    .local v17, "jsonObject":Lorg/json/JSONObject;
    new-instance v16, Lorg/json/JSONObject;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONObject;-><init>()V

    .line 83
    .local v16, "json":Lorg/json/JSONObject;
    const-string v26, "gameId"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 84
    .local v11, "gameId":Ljava/lang/String;
    const-string v26, "siteId"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 85
    .local v22, "siteId":Ljava/lang/String;
    const-string v26, "stationId"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/String;

    .line 86
    .local v23, "stationId":Ljava/lang/String;
    const-string v26, "nickName"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 87
    .local v19, "nickName":Ljava/lang/String;
    const-string v26, "accountType"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 88
    .local v3, "accountType":Ljava/lang/String;
    const-string v26, "client"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 90
    .local v6, "client":Ljava/lang/String;
    const-string v26, "role"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 91
    .local v20, "role":Ljava/lang/String;
    const-string v26, "vipLevel"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 92
    .local v25, "vipLevel":Ljava/lang/String;
    const-string v26, "avatarUri"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 93
    .local v4, "avatarUri":Ljava/lang/String;
    const-string v26, "gameName"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 94
    .local v12, "gameName":Ljava/lang/String;
    const-string v26, "gameVersion"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 95
    .local v13, "gameVersion":Ljava/lang/String;
    const-string v26, "userID"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 96
    .local v24, "userID":Ljava/lang/String;
    const-string v26, "deviceType"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 97
    .local v9, "deviceType":Ljava/lang/String;
    const-string v26, "deviceDetail"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 98
    .local v8, "deviceDetail":Ljava/lang/String;
    const-string v26, "connectivity"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 99
    .local v7, "connectivity":Ljava/lang/String;
    const-string v26, "ip"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 100
    .local v14, "ip":Ljava/lang/String;
    const-string v26, "mac"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 101
    .local v18, "mac":Ljava/lang/String;
    const-string v26, "browser"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 102
    .local v5, "browser":Ljava/lang/String;
    const-string v26, "screen"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 103
    .local v21, "screen":Ljava/lang/String;
    const-string v26, "OSVersion"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 104
    .local v2, "OSVersion":Ljava/lang/String;
    const-string v26, "jailbreak"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 105
    .local v15, "jailbreak":Ljava/lang/String;
    const-string v26, "operator"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v2    # "OSVersion":Ljava/lang/String;
    .end local v3    # "accountType":Ljava/lang/String;
    .end local v4    # "avatarUri":Ljava/lang/String;
    .end local v5    # "browser":Ljava/lang/String;
    .end local v6    # "client":Ljava/lang/String;
    .end local v7    # "connectivity":Ljava/lang/String;
    .end local v8    # "deviceDetail":Ljava/lang/String;
    .end local v9    # "deviceType":Ljava/lang/String;
    .end local v11    # "gameId":Ljava/lang/String;
    .end local v12    # "gameName":Ljava/lang/String;
    .end local v13    # "gameVersion":Ljava/lang/String;
    .end local v14    # "ip":Ljava/lang/String;
    .end local v15    # "jailbreak":Ljava/lang/String;
    .end local v16    # "json":Lorg/json/JSONObject;
    .end local v17    # "jsonObject":Lorg/json/JSONObject;
    .end local v18    # "mac":Ljava/lang/String;
    .end local v19    # "nickName":Ljava/lang/String;
    .end local v20    # "role":Ljava/lang/String;
    .end local v21    # "screen":Ljava/lang/String;
    .end local v22    # "siteId":Ljava/lang/String;
    .end local v23    # "stationId":Ljava/lang/String;
    .end local v24    # "userID":Ljava/lang/String;
    .end local v25    # "vipLevel":Ljava/lang/String;
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v10

    .line 176
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public init()V
    .locals 0

    .prologue
    .line 55
    return-void
.end method

.method public onService(ZLjava/lang/String;)V
    .locals 7
    .param p1, "isSuccess"    # Z
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 58
    const-string v4, "ServiceHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "onService = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " data = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :try_start_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 61
    .local v2, "msg":Landroid/os/Message;
    const/16 v4, 0x4ff

    iput v4, v2, Landroid/os/Message;->what:I

    .line 63
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 64
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "isSuccess"

    if-eqz p1, :cond_1

    const/4 v4, 0x1

    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v5, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    if-eqz p2, :cond_0

    .line 66
    const-string v4, "data"

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 69
    .local v0, "json":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .line 70
    .local v3, "result":Ljava/lang/String;
    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 72
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .end local v0    # "json":Lorg/json/JSONObject;
    .end local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "msg":Landroid/os/Message;
    .end local v3    # "result":Ljava/lang/String;
    :goto_1
    return-void

    .line 64
    .restart local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "msg":Landroid/os/Message;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 74
    .end local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "msg":Landroid/os/Message;
    :catch_0
    move-exception v4

    goto :goto_1
.end method
