.class public Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;
.super Ljava/lang/Object;
.source "ThirdPartyLoginHandler.java"


# static fields
.field public static final DICT_NAME:Ljava/lang/String; = "ThirdPartyLogin"

.field public static final KEY_FLAG:Ljava/lang/String; = "Flag"

.field public static final KEY_LOGINTAG:Ljava/lang/String; = "LoginTag"

.field public static final KEY_TOKEN:Ljava/lang/String; = "Token"

.field public static final Key_PARAMS:Ljava/lang/String; = "ExtraParams"

.field public static final LOGIN_CALLBACK:Ljava/lang/String; = "ThirdPartyLoginCallBack"

.field public static final LOGOUT_CALLBACK:Ljava/lang/String; = "ThirdPartyLogoutCallBack"

.field public static final SWITCH_ACCOUNT_CALLBACK:Ljava/lang/String; = "ThirdPartySwitchAccountCallBack"

.field private static s_instance:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->s_instance:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->s_instance:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    invoke-direct {v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;-><init>()V

    sput-object v0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->s_instance:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    .line 27
    :cond_0
    sget-object v0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->s_instance:Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;

    return-object v0
.end method

.method private postInMainThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 75
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 76
    return-void
.end method


# virtual methods
.method public isThirdPartySupportLogout()V
    .locals 1

    .prologue
    .line 61
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->isSupportQuitForLua()V

    .line 62
    return-void
.end method

.method public isThirdPartySupportSwitchAccount()V
    .locals 3

    .prologue
    .line 45
    const-string v1, "ThirdPartyLogin"

    const-string v2, "LoginTag"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->isSupportSwitchAccountForLua(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public requestThirdPartyLogin()V
    .locals 3

    .prologue
    .line 34
    const-string v1, "ThirdPartyLogin"

    const-string v2, "LoginTag"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "loginTag":Ljava/lang/String;
    new-instance v1, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$1;

    invoke-direct {v1, p0, v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$1;-><init>(Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->postInMainThread(Ljava/lang/Runnable;)V

    .line 42
    return-void
.end method

.method public requestThirdPartyLogout()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$3;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$3;-><init>(Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;)V

    invoke-direct {p0, v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->postInMainThread(Ljava/lang/Runnable;)V

    .line 72
    return-void
.end method

.method public requestThirdPartySwitchAccount()V
    .locals 3

    .prologue
    .line 50
    const-string v1, "ThirdPartyLogin"

    const-string v2, "LoginTag"

    invoke-static {v1, v2}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "loginTag":Ljava/lang/String;
    new-instance v1, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$2;

    invoke-direct {v1, p0, v0}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler$2;-><init>(Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/boyaa/entity/godsdk/thirdPartyLogin/ThirdPartyLoginHandler;->postInMainThread(Ljava/lang/Runnable;)V

    .line 58
    return-void
.end method
