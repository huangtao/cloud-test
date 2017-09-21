.class public Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;
.super Ljava/lang/Object;
.source "SimUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/core/utils/SimUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimEntity"
.end annotation


# instance fields
.field imsi:Ljava/lang/String;

.field mccmnc:I

.field operator:Lcom/boyaa/godsdk/core/utils/Operator;

.field phoneNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 283
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->imsi:Ljava/lang/String;

    .line 284
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->phoneNumber:Ljava/lang/String;

    .line 285
    invoke-static {p1}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getMccMncNumber(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->mccmnc:I

    .line 286
    iget v0, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->mccmnc:I

    invoke-static {p1, v0}, Lcom/boyaa/godsdk/core/utils/Operator;->getCurrentOperatorByMccMnc(Landroid/content/Context;I)Lcom/boyaa/godsdk/core/utils/Operator;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->operator:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 287
    return-void
.end method


# virtual methods
.method public parseToParamsMap()Ljava/util/Map;
    .locals 3
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
    .line 290
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 291
    .local v0, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "imsi"

    iget-object v2, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->imsi:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    const-string v1, "phone"

    iget-object v2, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    const-string v1, "mccmnc"

    iget v2, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->mccmnc:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    const-string v1, "operator"

    iget-object v2, p0, Lcom/boyaa/godsdk/core/utils/SimUtils$SimEntity;->operator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v2, v2, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    return-object v0
.end method
