.class public Lcom/boyaa/godsdk/callback/CallbackStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/godsdk/callback/CallbackStatus$AccountStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$ActivityCenterStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$AdsStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$IAPStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$InviteStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$LocationStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$PushStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$SDKStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$ShareStatus;,
        Lcom/boyaa/godsdk/callback/CallbackStatus$SpecialMethodStatus;
    }
.end annotation


# instance fields
.field private extras:Ljava/util/Map;

.field private mainStatus:I

.field private msg:Ljava/lang/String;

.field private subStatus:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    iput v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->mainStatus:I

    .line 332
    iput v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->subStatus:I

    .line 337
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->msg:Ljava/lang/String;

    .line 345
    return-void
.end method

.method public static obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;
    .locals 1

    .prologue
    .line 321
    new-instance v0, Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getExtras()Ljava/util/Map;
    .locals 1

    .prologue
    .line 369
    iget-object v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->extras:Ljava/util/Map;

    return-object v0
.end method

.method public getMainStatus()I
    .locals 1

    .prologue
    .line 348
    iget v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->mainStatus:I

    return v0
.end method

.method public getMsg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public getSubStatus()I
    .locals 1

    .prologue
    .line 354
    iget v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->subStatus:I

    return v0
.end method

.method public setExtras(Ljava/util/Map;)V
    .locals 0
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 366
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->extras:Ljava/util/Map;

    .line 367
    return-void
.end method

.method public setMainStatus(I)V
    .locals 0
    .param p1, "mainStatus"    # I

    .prologue
    .line 351
    iput p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->mainStatus:I

    .line 352
    return-void
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 363
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->msg:Ljava/lang/String;

    .line 364
    return-void
.end method

.method public setSubStatus(I)V
    .locals 0
    .param p1, "subStatus"    # I

    .prologue
    .line 357
    iput p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->subStatus:I

    .line 358
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 373
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CallbackStatus [mainStatus="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->mainStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", subStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 374
    iget v1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->subStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->msg:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "msg="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/boyaa/godsdk/callback/CallbackStatus;->msg:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 373
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 374
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method
