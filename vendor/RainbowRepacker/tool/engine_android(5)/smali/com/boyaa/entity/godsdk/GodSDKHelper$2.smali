.class Lcom/boyaa/entity/godsdk/GodSDKHelper$2;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/AccountListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoginFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 253
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->loginCallLuaBack(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    invoke-static {v0, v1, p2, v2, v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$5(Lcom/boyaa/entity/godsdk/GodSDKHelper;ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 254
    return-void
.end method

.method public onLoginSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 4
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 239
    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    # getter for: Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsFloatViewRequired:Z
    invoke-static {v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$4(Lcom/boyaa/entity/godsdk/GodSDKHelper;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 240
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v2

    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/GodSDKAccount;->showFloatView(Landroid/app/Activity;)V

    .line 242
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v2

    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v2, v3, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getUserId(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 244
    .local v1, "userId":Ljava/lang/String;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 248
    .local v0, "paramMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v3, 0x1

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->loginCallLuaBack(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    invoke-static {v2, v3, p2, v1, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$5(Lcom/boyaa/entity/godsdk/GodSDKHelper;ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 249
    return-void
.end method

.method public onLogoutFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 235
    return-void
.end method

.method public onLogoutSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKLogoutCallLuaBack(Ljava/lang/String;I)V
    invoke-static {v0, p2, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$3(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;I)V

    .line 231
    return-void
.end method

.method public onSDKLogout(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKLogoutCallLuaBack(Ljava/lang/String;I)V
    invoke-static {v0, p2, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$3(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;I)V

    .line 226
    return-void
.end method

.method public onSDKLogoutFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 220
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, -0x1

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKLogoutCallLuaBack(Ljava/lang/String;I)V
    invoke-static {v0, p2, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$3(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;I)V

    .line 221
    return-void
.end method

.method public onSDKLogoutSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x1

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKLogoutCallLuaBack(Ljava/lang/String;I)V
    invoke-static {v0, p2, v1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$3(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;I)V

    .line 216
    return-void
.end method

.method public onSDKSwitchAccount(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x0

    const/4 v2, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKSwitchAccountCallLuaBack(Ljava/lang/String;ILjava/lang/String;)V
    invoke-static {v0, p2, v1, v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$2(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;ILjava/lang/String;)V

    .line 211
    return-void
.end method

.method public onSDKSwitchAccountFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 205
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, -0x1

    const/4 v2, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKSwitchAccountCallLuaBack(Ljava/lang/String;ILjava/lang/String;)V
    invoke-static {v0, p2, v1, v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$2(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;ILjava/lang/String;)V

    .line 206
    return-void
.end method

.method public onSDKSwitchAccountSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 199
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v1

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1, v2, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getUserId(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 200
    .local v0, "userId":Ljava/lang/String;
    iget-object v1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v2, 0x1

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKSwitchAccountCallLuaBack(Ljava/lang/String;ILjava/lang/String;)V
    invoke-static {v1, p2, v2, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$2(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;ILjava/lang/String;)V

    .line 201
    return-void
.end method

.method public onSwitchAccountFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 194
    iget-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->switchAccountCallLuaback(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    invoke-static {v0, v1, p2, v2, v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$1(Lcom/boyaa/entity/godsdk/GodSDKHelper;ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 195
    return-void
.end method

.method public onSwitchAccountSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 4
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 188
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v1

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1, v2, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getUserId(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "userId":Ljava/lang/String;
    iget-object v1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;->this$0:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    const/4 v2, 0x1

    const/4 v3, 0x0

    # invokes: Lcom/boyaa/entity/godsdk/GodSDKHelper;->switchAccountCallLuaback(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    invoke-static {v1, v2, p2, v0, v3}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->access$1(Lcom/boyaa/entity/godsdk/GodSDKHelper;ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 190
    return-void
.end method
