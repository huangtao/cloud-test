.class public Lcom/boyaa/godsdk/core/GodSDKIAP;
.super Ljava/lang/Object;
.source "GodSDKIAP.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IIAPPlugin;


# static fields
.field private static final IAP_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKIAP"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKIAP;


# instance fields
.field private isInitSupporingPmodes:Z

.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

.field private mPmodePriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportingPmodesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/boyaa/godsdk/protocol/IAPPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->IAP_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 36
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->instance:Lcom/boyaa/godsdk/core/GodSDKIAP;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    .line 52
    iput-boolean v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebugMode:Z

    .line 55
    iput-boolean v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->isInitSupporingPmodes:Z

    .line 65
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 66
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/callback/IAPListener;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/godsdk/core/GodSDKIAP;)Lcom/boyaa/godsdk/core/utils/Debug;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 408
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->pay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 339
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->dealOrderInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private createBareCodeOrderAndPay(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x4e84

    const/4 v6, -0x2

    .line 291
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "createBareCodeOrderAndPay go in"

    invoke-virtual {v4, v5}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 293
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 295
    const-string v4, "\u521b\u5efa\u8ba2\u5355\u5931\u8d25,\u4f20\u5165\u4e0b\u5355\u53c2\u6570\u4e3anull"

    .line 294
    invoke-virtual {p0, v7, v6, v4}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    .line 337
    :goto_0
    return-void

    .line 299
    :cond_0
    invoke-static {p1, p2}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->generateBareCodeURL(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 301
    .local v2, "result":Ljava/lang/String;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 303
    .local v0, "json":Lorg/json/JSONObject;
    const-string v4, "ret"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 304
    .local v3, "ret":I
    const-string v4, "result"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 305
    .local v1, "mOrderUrl":Ljava/lang/String;
    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 307
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKIAP$6;

    invoke-direct {v4, p0, p1, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKIAP$6;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V

    .line 332
    invoke-virtual {v4, v1}, Lcom/boyaa/godsdk/core/GodSDKIAP$6;->doGet(Ljava/lang/String;)V

    goto :goto_0

    .line 334
    :cond_1
    invoke-virtual {p0, v7, v6, v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    goto :goto_0
.end method

.method private createOrderAndPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "pmode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 222
    invoke-static {p2}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->jsonStrToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v3

    .line 224
    .local v3, "parameterMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "url"

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p1, v0, v3}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->genURL(Landroid/content/Context;Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v6

    .line 227
    .local v6, "mOrderUrl":Ljava/lang/String;
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKIAP$5;

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKIAP$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Landroid/content/Context;Ljava/util/HashMap;Ljava/lang/String;Landroid/app/Activity;)V

    .line 278
    invoke-virtual {v0, v6}, Lcom/boyaa/godsdk/core/GodSDKIAP$5;->doGet(Ljava/lang/String;)V

    .line 279
    return-void
.end method

.method private dealOrderInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 26
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "result"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 342
    new-instance v9, Lorg/json/JSONObject;

    move-object/from16 v0, p3

    invoke-direct {v9, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 343
    .local v9, "json":Lorg/json/JSONObject;
    const-string v23, "RET"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 344
    .local v18, "ret":Ljava/lang/String;
    const-string v23, "MSG"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 345
    .local v19, "retmsg":Ljava/lang/String;
    const-string v23, "0"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_2

    .line 347
    const-string v23, "PAYTYPE"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 348
    .local v14, "paytype":Ljava/lang/String;
    const-string v23, "ORDER"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 349
    .local v11, "orderid":Ljava/lang/String;
    const-string v23, "PAMOUNT"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 350
    .local v12, "pamount":Ljava/lang/String;
    const-string v23, "EXT"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 351
    .local v6, "ext":Ljava/lang/String;
    const-string v23, "ITEM_ID"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 353
    .local v8, "itemId":Ljava/lang/String;
    const-string v23, "URL"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 355
    .local v22, "url":Ljava/lang/String;
    const-string v23, "SMS_RECEIVERS"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 356
    .local v16, "receiver":Ljava/lang/String;
    const-string v23, "SHIELD"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 357
    .local v20, "shield":Ljava/lang/String;
    const-string v23, "SMS_COUNT"

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    .line 358
    .local v10, "len":I
    new-instance v21, Lorg/json/JSONObject;

    invoke-direct/range {v21 .. v21}, Lorg/json/JSONObject;-><init>()V

    .line 359
    .local v21, "smsBody":Lorg/json/JSONObject;
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-nez v23, :cond_0

    .line 360
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 361
    .local v17, "receiverJson":Lorg/json/JSONObject;
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 362
    .local v5, "bodyList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/json/JSONObject;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-lt v7, v10, :cond_1

    .line 366
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v5}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 367
    .local v4, "body":Lorg/json/JSONArray;
    const-string v23, "smsbody"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 369
    .end local v4    # "body":Lorg/json/JSONArray;
    .end local v5    # "bodyList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/json/JSONObject;>;"
    .end local v7    # "i":I
    .end local v17    # "receiverJson":Lorg/json/JSONObject;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "dealOrderInfo------------smsBody="

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 372
    new-instance v13, Lorg/json/JSONObject;

    move-object/from16 v0, p2

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 374
    .local v13, "payResult":Lorg/json/JSONObject;
    const-string v23, "paytype"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 375
    const-string v23, "receivers"

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 376
    const-string v23, "orderid"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 377
    const-string v23, "pamount"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 378
    const-string v23, "url"

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 379
    const-string v23, "ext"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 380
    const-string v23, "shield"

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 381
    const-string v23, "itemId"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 382
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "dealOrderInfo------------payResult="

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 383
    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v23

    const-string v24, "9999"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->pay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    .end local v6    # "ext":Ljava/lang/String;
    .end local v8    # "itemId":Ljava/lang/String;
    .end local v10    # "len":I
    .end local v11    # "orderid":Ljava/lang/String;
    .end local v12    # "pamount":Ljava/lang/String;
    .end local v13    # "payResult":Lorg/json/JSONObject;
    .end local v14    # "paytype":Ljava/lang/String;
    .end local v16    # "receiver":Ljava/lang/String;
    .end local v20    # "shield":Ljava/lang/String;
    .end local v21    # "smsBody":Lorg/json/JSONObject;
    .end local v22    # "url":Ljava/lang/String;
    :goto_1
    return-void

    .line 363
    .restart local v5    # "bodyList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/json/JSONObject;>;"
    .restart local v6    # "ext":Ljava/lang/String;
    .restart local v7    # "i":I
    .restart local v8    # "itemId":Ljava/lang/String;
    .restart local v10    # "len":I
    .restart local v11    # "orderid":Ljava/lang/String;
    .restart local v12    # "pamount":Ljava/lang/String;
    .restart local v14    # "paytype":Ljava/lang/String;
    .restart local v16    # "receiver":Ljava/lang/String;
    .restart local v17    # "receiverJson":Lorg/json/JSONObject;
    .restart local v20    # "shield":Ljava/lang/String;
    .restart local v21    # "smsBody":Lorg/json/JSONObject;
    .restart local v22    # "url":Ljava/lang/String;
    :cond_1
    new-instance v23, Ljava/lang/StringBuilder;

    const-string v24, "address"

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v24, v7, 0x1

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 364
    .local v15, "perSMSJObj":Lorg/json/JSONObject;
    invoke-virtual {v5, v15}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 362
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 385
    .end local v5    # "bodyList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/json/JSONObject;>;"
    .end local v6    # "ext":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "itemId":Ljava/lang/String;
    .end local v10    # "len":I
    .end local v11    # "orderid":Ljava/lang/String;
    .end local v12    # "pamount":Ljava/lang/String;
    .end local v14    # "paytype":Ljava/lang/String;
    .end local v15    # "perSMSJObj":Lorg/json/JSONObject;
    .end local v16    # "receiver":Ljava/lang/String;
    .end local v17    # "receiverJson":Lorg/json/JSONObject;
    .end local v20    # "shield":Ljava/lang/String;
    .end local v21    # "smsBody":Lorg/json/JSONObject;
    .end local v22    # "url":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "create order failed:"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 386
    const/16 v23, 0x4e84

    .line 387
    const/16 v24, -0x2

    .line 386
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->responseCallbackPay(IILjava/lang/String;)V

    goto :goto_1
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->instance:Lcom/boyaa/godsdk/core/GodSDKIAP;

    if-nez v0, :cond_0

    .line 40
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->syncInit()V

    .line 42
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->instance:Lcom/boyaa/godsdk/core/GodSDKIAP;

    return-object v0
.end method

.method private getPluginObjectByPmode(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "pmode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 545
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getSupportingPmodesMap()Ljava/util/Map;

    move-result-object v1

    .line 546
    .local v1, "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 547
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getPmodeByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 531
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 532
    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 533
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 535
    .local v1, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKIAP;->IAP_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getPmode"

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 534
    invoke-static {v4, v5, v6, v1, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 537
    :catch_0
    move-exception v0

    .line 538
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getPmodeByClassName Exception"

    invoke-virtual {v4, v5, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v2, v3

    .line 540
    goto :goto_0
.end method

.method private getSupportingPmodesMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 492
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mSupportingPmodesMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->isInitSupporingPmodes()Z

    move-result v0

    if-nez v0, :cond_1

    .line 493
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->initSupporingPmodes()V

    .line 495
    :cond_1
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mSupportingPmodesMap:Ljava/util/Map;

    return-object v0
.end method

.method private declared-synchronized initDefaultPmodePriorityList()V
    .locals 15

    .prologue
    .line 564
    monitor-enter p0

    :try_start_0
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    if-nez v9, :cond_0

    .line 565
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    .line 567
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 569
    .local v2, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :try_start_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v9

    if-nez v9, :cond_2

    .line 598
    :goto_1
    monitor-exit p0

    return-void

    .line 569
    :cond_2
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 571
    .local v1, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 572
    .local v7, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v8

    .line 573
    .local v8, "type2":I
    and-int v6, v7, v8

    .line 575
    .local v6, "result":I
    if-ne v6, v8, :cond_1

    .line 577
    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v9

    .line 576
    invoke-direct {p0, v9}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getPmodeByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 577
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 578
    .local v4, "pmodeStrs":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 579
    const-string v9, "[,_\\-;]"

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 580
    .local v5, "pmodes":[Ljava/lang/String;
    array-length v11, v5

    const/4 v9, 0x0

    :goto_2
    if-lt v9, v11, :cond_4

    .line 586
    .end local v5    # "pmodes":[Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultPmodePriorityList pmodes list="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 587
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/util/List;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    aput-object v14, v12, v13

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 586
    invoke-virtual {v9, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 589
    .end local v4    # "pmodeStrs":Ljava/lang/String;
    .end local v6    # "result":I
    .end local v7    # "type1":I
    .end local v8    # "type2":I
    :catch_0
    move-exception v0

    .line 590
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 591
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultPmodePriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 592
    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 591
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 590
    invoke-virtual {v9, v11, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 595
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v1    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v0

    .line 596
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v10, "initDefaultPmodePriorityList Exception"

    invoke-virtual {v9, v10, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 564
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 580
    .restart local v1    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v2    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    .restart local v4    # "pmodeStrs":Ljava/lang/String;
    .restart local v5    # "pmodes":[Ljava/lang/String;
    .restart local v6    # "result":I
    .restart local v7    # "type1":I
    .restart local v8    # "type2":I
    :cond_4
    :try_start_6
    aget-object v3, v5, v9

    .line 581
    .local v3, "pmode":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 582
    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 580
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method

.method private declared-synchronized initSupporingPmodes()V
    .locals 12

    .prologue
    const/4 v8, 0x0

    .line 499
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mSupportingPmodesMap:Ljava/util/Map;

    if-eqz v7, :cond_0

    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->isInitSupporingPmodes()Z

    move-result v7

    if-nez v7, :cond_2

    .line 500
    :cond_0
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mSupportingPmodesMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 502
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 503
    invoke-virtual {v7, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v3

    .line 504
    .local v3, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    if-eqz v3, :cond_5

    .line 505
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_3

    .line 518
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lcom/boyaa/godsdk/core/GodSDKIAP;->setInitSupporingPmodes(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 527
    .end local v3    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 505
    .restart local v3    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_3
    :try_start_2
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 506
    .local v2, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 507
    .local v0, "className":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getPmodeByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 508
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 509
    .local v5, "pmodeStrs":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 510
    const-string v7, "[,_\\-;]"

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 511
    .local v6, "pmodes":[Ljava/lang/String;
    array-length v10, v6

    move v7, v8

    :goto_1
    if-ge v7, v10, :cond_1

    aget-object v4, v6, v7

    .line 512
    .local v4, "pmode":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_4

    .line 513
    iget-object v11, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mSupportingPmodesMap:Ljava/util/Map;

    invoke-interface {v11, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 520
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v4    # "pmode":Ljava/lang/String;
    .end local v5    # "pmodeStrs":Ljava/lang/String;
    .end local v6    # "pmodes":[Ljava/lang/String;
    :cond_5
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "GodSDKIAP plugin is not parsed all"

    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 522
    .end local v3    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v1

    .line 523
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initSupporingPmodes Exception"

    invoke-virtual {v7, v8, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 524
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Lcom/boyaa/godsdk/core/GodSDKIAP;->setInitSupporingPmodes(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 499
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private pay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "pmode"    # Ljava/lang/String;

    .prologue
    .line 410
    :try_start_0
    invoke-direct {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getPluginObjectByPmode(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 411
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    .line 410
    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 412
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKIAP;->IAP_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "pay"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    .line 413
    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/IAPListener;

    aput-object v6, v4, v5

    .line 414
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    aput-object v7, v5, v6

    .line 412
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 432
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 415
    :catch_0
    move-exception v0

    .line 416
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKIAP.pay Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 417
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    if-eqz v2, :cond_0

    .line 418
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKIAP$8;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP$8;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 46
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKIAP;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->instance:Lcom/boyaa/godsdk/core/GodSDKIAP;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKIAP;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKIAP;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKIAP;->instance:Lcom/boyaa/godsdk/core/GodSDKIAP;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_0
    monitor-exit v1

    return-void

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 7
    .param p1, "pmode"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 650
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getSupportingPmodesMap()Ljava/util/Map;

    move-result-object v3

    .line 651
    .local v3, "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 652
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 653
    invoke-virtual {v4, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 654
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 655
    .local v2, "obj":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 657
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    .line 658
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 656
    invoke-static {v0, p2, v4, v2, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 676
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "obj":Ljava/lang/Object;
    .end local v3    # "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return-object v4

    .line 659
    :catch_0
    move-exception v1

    .line 660
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "callSpecialMethod "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Exception"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 661
    if-eqz p4, :cond_0

    .line 662
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKIAP$9;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKIAP$9;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 676
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "map"    # Ljava/util/Map;
    .param p3, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 638
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getDefaultPmode()Ljava/lang/String;

    move-result-object v0

    .line 639
    .local v0, "pmode":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 640
    const/4 v1, 0x0

    .line 642
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 472
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 477
    const-string v0, "GodSDKIAP"

    return-object v0
.end method

.method public getDefaultPmode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 552
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 553
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->initDefaultPmodePriorityList()V

    .line 555
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultLoginTag mLoginTagPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 556
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 555
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 557
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 558
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mPmodePriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 560
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getIAPListener()Lcom/boyaa/godsdk/callback/IAPListener;
    .locals 1

    .prologue
    .line 462
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    return-object v0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 482
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getSupportingPmodes()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 487
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getSupportingPmodesMap()Ljava/util/Map;

    move-result-object v0

    .line 488
    .local v0, "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public isInitSupporingPmodes()Z
    .locals 1

    .prologue
    .line 449
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->isInitSupporingPmodes:Z

    return v0
.end method

.method public isLoginRequired(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "pmode"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 436
    :try_start_0
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getPluginObjectByPmode(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 437
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    .line 436
    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 439
    .local v1, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKIAP;->IAP_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "isLoginRequired"

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 438
    invoke-static {v4, v5, v6, v1, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 440
    .local v2, "result":Ljava/lang/String;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "GoDSDKIAP isLoginRequired == "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    .end local v1    # "obj":Ljava/lang/Object;
    .end local v2    # "result":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 442
    :catch_0
    move-exception v0

    .line 443
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "GoDSDKIAP getPmode isLoginRequired"

    invoke-virtual {v4, v5, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v2, v3

    .line 444
    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 602
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getDefaultPmode()Ljava/lang/String;

    move-result-object v0

    .line 603
    .local v0, "pmode":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 604
    const/4 v1, 0x0

    .line 606
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKIAP;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "pmode"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 613
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getSupportingPmodesMap()Ljava/util/Map;

    move-result-object v4

    .line 614
    .local v4, "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 615
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 616
    invoke-virtual {v7, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 617
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->IAP:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 618
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 619
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 620
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 621
    const-string v9, ", isMemberClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isMemberClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 619
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 623
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 622
    invoke-static {v0, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 624
    .local v2, "method":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_0

    .line 632
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v4    # "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return v5

    .restart local v0    # "className":Ljava/lang/String;
    .restart local v2    # "method":Ljava/lang/reflect/Method;
    .restart local v3    # "obj":Ljava/lang/Object;
    .restart local v4    # "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    move v5, v6

    .line 627
    goto :goto_0

    .line 629
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v4    # "pmodeClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 630
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 632
    goto :goto_0
.end method

.method public requestPay(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    .line 183
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 184
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "pmode"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 185
    .local v2, "pmode":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->requestPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "pmode":Ljava/lang/String;
    :goto_0
    return-void

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 188
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v4, 0x4e84

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 189
    const/4 v4, -0x2

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 190
    const-string v4, "\u652f\u4ed8\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709pmode\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 191
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/IAPListener;->onPayFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "pmode"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "GodSDKIAP.requestPay parmas == "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", pmode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 71
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 72
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v1

    if-nez v1, :cond_1

    .line 73
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Lcom/boyaa/godsdk/core/GodSDKIAP$1;

    invoke-direct {v1, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 88
    :cond_1
    invoke-virtual {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->isLoginRequired(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 91
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 93
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->pay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_2
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    if-eqz v1, :cond_0

    .line 96
    new-instance v1, Lcom/boyaa/godsdk/core/GodSDKIAP$2;

    invoke-direct {v1, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 111
    :cond_3
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->pay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestPayDirectly(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    .line 198
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 199
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "pmode"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 200
    .local v2, "pmode":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->requestPayDirectly(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "pmode":Ljava/lang/String;
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 203
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v4, 0x4e84

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 204
    const/4 v4, -0x2

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 205
    const-string v4, "\u652f\u4ed8\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709pmode\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 206
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/IAPListener;->onPayFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestPayDirectly(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "pmode"    # Ljava/lang/String;

    .prologue
    .line 118
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "GodSDKIAP.requestPayDirectly parmas == "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 119
    const-string v4, ", pmode = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 118
    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 120
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v2

    if-nez v2, :cond_1

    .line 121
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    if-eqz v2, :cond_0

    .line 122
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKIAP$3;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 136
    :cond_1
    invoke-virtual {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->isLoginRequired(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "loginTag":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 139
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 142
    :try_start_0
    const-string v2, "9999"

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 143
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->createOrderAndPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 145
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    invoke-direct {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->createBareCodeOrderAndPay(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 151
    :cond_3
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    if-eqz v2, :cond_0

    .line 152
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKIAP$4;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 168
    :cond_4
    :try_start_2
    const-string v2, "9999"

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 169
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->createOrderAndPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 173
    :catch_1
    move-exception v0

    .line 174
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 171
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    :try_start_3
    invoke-direct {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->createBareCodeOrderAndPay(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method public responseCallbackPay(IILjava/lang/String;)V
    .locals 1
    .param p1, "main"    # I
    .param p2, "sub"    # I
    .param p3, "msg"    # Ljava/lang/String;

    .prologue
    .line 393
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    if-eqz v0, :cond_0

    .line 394
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKIAP$7;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKIAP$7;-><init>(Lcom/boyaa/godsdk/core/GodSDKIAP;IILjava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 406
    :cond_0
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 467
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mDebugMode:Z

    .line 468
    return-void
.end method

.method public setIAPListener(Lcom/boyaa/godsdk/callback/IAPListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/IAPListener;

    .prologue
    .line 458
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    .line 459
    return-void
.end method

.method public setInitSupporingPmodes(Z)V
    .locals 0
    .param p1, "isInitSupporingPmodes"    # Z

    .prologue
    .line 453
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKIAP;->isInitSupporingPmodes:Z

    .line 454
    return-void
.end method
