.class public Lcom/boyaa/app/php/PHPResult;
.super Ljava/lang/Object;
.source "PHPResult.java"


# static fields
.field public static final ERROR_NUMBER_:I = 0x33

.field public static final ERROR_NUMBER_ConnectTimeoutException:I = -0x3

.field public static final ERROR_NUMBER_Exception:I = -0x5

.field public static final ERROR_NUMBER_IOException:I = -0x4

.field public static final ERROR_NUMBER_MalformedURLException:I = -0x1

.field public static final ERROR_NUMBER_NOERROR:I = 0x0

.field public static final ERROR_NUMBER_PHPSERVER:I = -0x6

.field public static final ERROR_NUMBER_ProtocolException:I = -0x2

.field public static final JSON_ERROR:I = -0x2

.field public static final NETWORK_ERROR:I = -0x1

.field public static final SERVER_ERROR:I = -0x3

.field public static final SUCCESS:I = 0x0

.field public static final USER_ABORT:I = -0x5

.field public static final USER_CODE1:I = 0x1

.field public static final json_error:Ljava/lang/String; = "json error:"

.field public static final network_error:Ljava/lang/String; = "network error:"

.field public static final server_error:Ljava/lang/String; = "server response:"


# instance fields
.field public code:I

.field public error:Ljava/lang/String;

.field public errorNumber:I

.field public json:Ljava/lang/String;

.field public obj:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput v0, p0, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 62
    iput v0, p0, Lcom/boyaa/app/php/PHPResult;->errorNumber:I

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->obj:Lorg/json/JSONObject;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->json:Ljava/lang/String;

    .line 9
    return-void
.end method


# virtual methods
.method public JsonError(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 52
    const/4 v0, -0x2

    iput v0, p0, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 53
    invoke-virtual {p0, p1}, Lcom/boyaa/app/php/PHPResult;->setError(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public afterExplain(Lcom/boyaa/app/common/ICallBackListener;)V
    .locals 2
    .param p1, "callback"    # Lcom/boyaa/app/common/ICallBackListener;

    .prologue
    .line 77
    iget v0, p0, Lcom/boyaa/app/php/PHPResult;->code:I

    packed-switch v0, :pswitch_data_0

    .line 108
    :goto_0
    :pswitch_0
    return-void

    .line 80
    :pswitch_1
    invoke-interface {p1}, Lcom/boyaa/app/common/ICallBackListener;->onSucceed()V

    goto :goto_0

    .line 83
    :pswitch_2
    iget-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/boyaa/app/common/ICallBackListener;->onNetWorkError(Ljava/lang/String;)V

    goto :goto_0

    .line 87
    :pswitch_3
    iget-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/boyaa/app/common/ICallBackListener;->onJsonError(Ljava/lang/String;)V

    goto :goto_0

    .line 91
    :pswitch_4
    invoke-interface {p1}, Lcom/boyaa/app/common/ICallBackListener;->onFailed()V

    goto :goto_0

    .line 95
    :pswitch_5
    iget-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/boyaa/app/common/ICallBackListener;->onAbort(Ljava/lang/String;)V

    goto :goto_0

    .line 100
    :pswitch_6
    iget v0, p0, Lcom/boyaa/app/php/PHPResult;->code:I

    iget-object v1, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/boyaa/app/common/ICallBackListener;->onUserDefineError(ILjava/lang/String;)V

    goto :goto_0

    .line 77
    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_6
    .end packed-switch
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 69
    iput v0, p0, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 70
    iput v0, p0, Lcom/boyaa/app/php/PHPResult;->errorNumber:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->obj:Lorg/json/JSONObject;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->json:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setError(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 26
    iget v0, p0, Lcom/boyaa/app/php/PHPResult;->code:I

    packed-switch v0, :pswitch_data_0

    .line 49
    :goto_0
    :pswitch_0
    return-void

    .line 29
    :pswitch_1
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    goto :goto_0

    .line 32
    :pswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "network error:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    goto :goto_0

    .line 35
    :pswitch_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "json error:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    goto :goto_0

    .line 38
    :pswitch_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "server response:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    goto :goto_0

    .line 41
    :pswitch_5
    iput-object p1, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    goto :goto_0

    .line 44
    :pswitch_6
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/app/php/PHPResult;->error:Ljava/lang/String;

    goto :goto_0

    .line 26
    nop

    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_6
    .end packed-switch
.end method
