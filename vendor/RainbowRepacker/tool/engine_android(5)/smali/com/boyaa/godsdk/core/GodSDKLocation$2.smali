.class Lcom/boyaa/godsdk/core/GodSDKLocation$2;
.super Ljava/lang/Object;
.source "GodSDKLocation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/godsdk/core/GodSDKLocation;->startLocate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKLocation;

.field private final synthetic val$locationChannel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/godsdk/core/GodSDKLocation;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKLocation$2;->this$0:Lcom/boyaa/godsdk/core/GodSDKLocation;

    iput-object p2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation$2;->val$locationChannel:Ljava/lang/String;

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 189
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v0

    .line 190
    .local v0, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const v1, 0x15ff5

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 191
    const/4 v1, -0x4

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 192
    const-string v1, "startLocate\u5931\u8d25\uff0cGodSDK\u672a\u521d\u59cb\u5316"

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 193
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKLocation$2;->this$0:Lcom/boyaa/godsdk/core/GodSDKLocation;

    # getter for: Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;
    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDKLocation;->access$0(Lcom/boyaa/godsdk/core/GodSDKLocation;)Lcom/boyaa/godsdk/callback/LocationListener;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation$2;->val$locationChannel:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {v1, v0, v2, v3}, Lcom/boyaa/godsdk/callback/LocationListener;->onFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    .line 194
    return-void
.end method
