.class Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$1;
.super Ljava/lang/Object;
.source "GodSDKWechatHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->weixinSendText()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$jsonStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$1;->val$jsonStr:Ljava/lang/String;

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 159
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$1;->val$jsonStr:Ljava/lang/String;

    const-string v2, "weixin"

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->share(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return-void
.end method
