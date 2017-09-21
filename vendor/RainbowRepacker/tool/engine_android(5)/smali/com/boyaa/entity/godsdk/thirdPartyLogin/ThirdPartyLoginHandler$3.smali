.class Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$3;
.super Ljava/lang/Object;
.source "ThirdPartyLoginHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->requestThirdPartyLogout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$3;->this$0:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 69
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->requestGodSDKQuit()V

    .line 70
    return-void
.end method
