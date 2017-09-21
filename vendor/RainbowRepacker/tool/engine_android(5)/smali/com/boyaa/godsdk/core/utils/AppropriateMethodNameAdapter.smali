.class public Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;
.super Ljava/lang/Object;
.source "AppropriateMethodNameAdapter.java"


# static fields
.field public static methodDictionary:Ljava/util/Map;
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
    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    .line 11
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->init()V

    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSuitableMethod(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "origMethodName"    # Ljava/lang/String;
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 51
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static init()V
    .locals 3

    .prologue
    .line 15
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_oppo"

    const-string v2, "doGetAccessToken"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_huawei"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_anzhi"

    const-string v2, "doObtainAnZhiSessionKey"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_heyouxi"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_sogou"

    const-string v2, "doObtainSessionKey"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_lenovo"

    const-string v2, "getLenovoAccessToken"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_fetion"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_360"

    const-string v2, "doObtainAccessToken"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_yidongmm"

    const-string v2, "doObtainAccessToken"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_kugou"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_xiaomi"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_zhangyue"

    const-string v2, "doObtainAccessToken"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_Weixin"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getAccessToken_toutiao"

    const-string v2, "doObtainAccessToken"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_oppo"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_huawei"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_anzhi"

    const-string v2, "getAnZhiLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_heyouxi"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_sogou"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_lenovo"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_fetion"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_360"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_yidongmm"

    const-string v2, "doObtainUserInfo"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_kugou"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_xiaomi"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_zhangyue"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_Weixin"

    const-string v2, "getLoginExtraInfos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->methodDictionary:Ljava/util/Map;

    const-string v1, "getLoginExtraInfos_toutiao"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    return-void
.end method
