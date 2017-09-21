.class public Lcom/boyaa/entity/QRUtil/QRUtil;
.super Ljava/lang/Object;
.source "QRUtil.java"


# static fields
.field private static instance:Lcom/boyaa/entity/QRUtil/QRUtil;


# instance fields
.field private m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/entity/QRUtil/QRUtil;->instance:Lcom/boyaa/entity/QRUtil/QRUtil;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/entity/QRUtil/QRUtil;->m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    .line 28
    invoke-direct {p0}, Lcom/boyaa/entity/QRUtil/QRUtil;->createListener()V

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/entity/QRUtil/QRUtil;Z)V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/boyaa/entity/QRUtil/QRUtil;->responseCreateQR(Z)V

    return-void
.end method

.method private createListener()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lcom/boyaa/entity/QRUtil/QRUtil$1;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/QRUtil/QRUtil$1;-><init>(Lcom/boyaa/entity/QRUtil/QRUtil;)V

    iput-object v0, p0, Lcom/boyaa/entity/QRUtil/QRUtil;->m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    .line 53
    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/QRUtil/QRUtil;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/boyaa/entity/QRUtil/QRUtil;->instance:Lcom/boyaa/entity/QRUtil/QRUtil;

    if-nez v0, :cond_0

    .line 33
    invoke-static {}, Lcom/boyaa/entity/QRUtil/QRUtil;->initInstance()V

    .line 35
    :cond_0
    sget-object v0, Lcom/boyaa/entity/QRUtil/QRUtil;->instance:Lcom/boyaa/entity/QRUtil/QRUtil;

    return-object v0
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 39
    const-class v1, Lcom/boyaa/entity/QRUtil/QRUtil;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/entity/QRUtil/QRUtil;->instance:Lcom/boyaa/entity/QRUtil/QRUtil;

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Lcom/boyaa/entity/QRUtil/QRUtil;

    invoke-direct {v0}, Lcom/boyaa/entity/QRUtil/QRUtil;-><init>()V

    sput-object v0, Lcom/boyaa/entity/QRUtil/QRUtil;->instance:Lcom/boyaa/entity/QRUtil/QRUtil;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :cond_0
    monitor-exit v1

    return-void

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private responseCreateQR(Z)V
    .locals 6
    .param p1, "isSuccess"    # Z

    .prologue
    .line 76
    const-string v3, "QRUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "responseCreateQR = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "isSuccess"

    if-eqz p1, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 80
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 81
    .local v2, "msg":Landroid/os/Message;
    const/16 v3, 0x4f6

    iput v3, v2, Landroid/os/Message;->what:I

    .line 82
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 84
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .end local v2    # "msg":Landroid/os/Message;
    :goto_1
    return-void

    .line 79
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public createQR(Ljava/lang/String;)V
    .locals 10
    .param p1, "params"    # Ljava/lang/String;

    .prologue
    .line 57
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 58
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "imagePath"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "imagePath":Ljava/lang/String;
    const-string v0, "extParams"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "extParams":Ljava/lang/String;
    const-string v0, "sideLength"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 61
    .local v2, "sideLength":I
    const-string v0, "needIcon"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    .line 63
    .local v8, "needIcon":Z
    const-string v0, "QRUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v9, "createQR params = "

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const/4 v4, 0x0

    .line 65
    .local v4, "logoBmp":Landroid/graphics/Bitmap;
    if-eqz v8, :cond_0

    .line 66
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f02000f

    invoke-static {v0, v5}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 68
    :cond_0
    invoke-static {}, Lcom/dtr/zxing/createQR/QRCreator;->getInstance()Lcom/dtr/zxing/createQR/QRCreator;

    move-result-object v0

    iget-object v5, p0, Lcom/boyaa/entity/QRUtil/QRUtil;->m_IQRCreatorListener:Lcom/dtr/zxing/createQR/IQRCreatorListener;

    invoke-virtual/range {v0 .. v5}, Lcom/dtr/zxing/createQR/QRCreator;->createQR(Ljava/lang/String;ILjava/lang/String;Landroid/graphics/Bitmap;Lcom/dtr/zxing/createQR/IQRCreatorListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .end local v1    # "extParams":Ljava/lang/String;
    .end local v2    # "sideLength":I
    .end local v3    # "imagePath":Ljava/lang/String;
    .end local v4    # "logoBmp":Landroid/graphics/Bitmap;
    .end local v7    # "json":Lorg/json/JSONObject;
    .end local v8    # "needIcon":Z
    :goto_0
    return-void

    .line 69
    :catch_0
    move-exception v6

    .line 71
    .local v6, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/boyaa/entity/QRUtil/QRUtil;->responseCreateQR(Z)V

    goto :goto_0
.end method

.method public responseScanQR(ZLjava/lang/String;)V
    .locals 7
    .param p1, "isSuccess"    # Z
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 98
    const-string v4, "QRUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "responseScanQR = "

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

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    :try_start_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 101
    .local v2, "msg":Landroid/os/Message;
    const/16 v4, 0x4f7

    iput v4, v2, Landroid/os/Message;->what:I

    .line 103
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 104
    .local v1, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "isSuccess"

    if-eqz p1, :cond_1

    const/4 v4, 0x1

    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v5, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    if-eqz p2, :cond_0

    .line 106
    const-string v4, "data"

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 109
    .local v0, "json":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .line 110
    .local v3, "result":Ljava/lang/String;
    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 112
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .end local v0    # "json":Lorg/json/JSONObject;
    .end local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "msg":Landroid/os/Message;
    .end local v3    # "result":Ljava/lang/String;
    :goto_1
    return-void

    .line 104
    .restart local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "msg":Landroid/os/Message;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 114
    .end local v1    # "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "msg":Landroid/os/Message;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public scanQR()V
    .locals 3

    .prologue
    .line 92
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 93
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-class v2, Lcom/dtr/zxing/activity/CaptureActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 94
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const/16 v2, 0x1006

    invoke-virtual {v1, v0, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 95
    return-void
.end method
