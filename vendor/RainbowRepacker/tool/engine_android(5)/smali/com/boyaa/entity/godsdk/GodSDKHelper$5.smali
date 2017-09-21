.class Lcom/boyaa/entity/godsdk/GodSDKHelper$5;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final end:I

.field private i:I

.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/16 v0, 0x4e20

    iput v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->i:I

    .line 85
    const/16 v0, 0x4e84

    iput v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->end:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 95
    iget v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->i:I

    const/16 v1, 0x4e84

    if-ge v0, v1, :cond_0

    .line 96
    const/4 v0, 0x1

    .line 98
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 89
    iget v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->i:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->i:I

    .line 90
    iget v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->i:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;->next()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
