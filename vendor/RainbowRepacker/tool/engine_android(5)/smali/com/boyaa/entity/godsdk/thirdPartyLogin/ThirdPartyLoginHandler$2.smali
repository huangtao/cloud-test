.class Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$2;
.super Ljava/lang/Object;
.source "ThirdPartyLoginHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->requestThirdPartySwitchAccount()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

.field private final synthetic val$loginTag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$2;->this$0:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    iput-object p2, p0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$2;->val$loginTag:Ljava/lang/String;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 55
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$2;->val$loginTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->requestSwitchAccount(Ljava/lang/String;)V

    .line 56
    return-void
.end method
