.class Lcom/boyaa/godsdk/core/GodSDKAds$7;
.super Ljava/lang/Object;
.source "GodSDKAds.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKAds;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKAds;

.field private final synthetic val$listener:Lcom/boyaa/godsdk/callback/SpecialMethodListener;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKAds;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKAds$7;->this$0:Lcom/boyaa/godsdk/core/GodSDKAds;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKAds$7;->val$listener:Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .line 536
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 540
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 541
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v1, 0x7594

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 542
    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 543
    const-string v1, "callSpecialMethod\u53d1\u751f\u5f02\u5e38"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 544
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKAds$7;->val$listener:Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/boyaa/godsdk/callback/SpecialMethodListener;->onCallFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/util/Map;)V

    .line 545
    return-void
.end method
