.class public interface abstract Lcom/boyaa/godsdk/protocol/AccountPluginProtocol;
.super Ljava/lang/Object;
.source "AccountPluginProtocol.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/ILoginable;


# virtual methods
.method public abstract getUserID(Landroid/app/Activity;)Ljava/lang/String;
.end method

.method public abstract hideFloatView(Landroid/app/Activity;)V
.end method

.method public abstract isFloatViewRequired()Z
.end method

.method public abstract isLogined(Landroid/app/Activity;)Z
.end method

.method public abstract isSupportLogout()Z
.end method

.method public abstract isSupportSwitchAccount()Z
.end method

.method public abstract login(Landroid/app/Activity;Lcom/boyaa/godsdk/callback/AccountListener;)V
.end method

.method public abstract logout(Landroid/app/Activity;Lcom/boyaa/godsdk/callback/AccountListener;)V
.end method

.method public abstract showFloatView(Landroid/app/Activity;)V
.end method

.method public abstract switchAccount(Landroid/app/Activity;Lcom/boyaa/godsdk/callback/AccountListener;)V
.end method
