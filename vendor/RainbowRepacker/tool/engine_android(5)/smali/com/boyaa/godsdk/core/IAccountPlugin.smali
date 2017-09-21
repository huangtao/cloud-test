.class public interface abstract Lcom/boyaa/godsdk/core/IAccountPlugin;
.super Ljava/lang/Object;
.source "IAccountPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract getAccessToken(Landroid/app/Activity;)Ljava/lang/String;
.end method

.method public abstract getAccessToken(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getDefaultLoginTag()Ljava/lang/String;
.end method

.method public abstract getLoginExtraInfos(Landroid/app/Activity;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLoginExtraInfos(Landroid/app/Activity;Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSupportLoginTags()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUserId(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract hideFloatView(Landroid/app/Activity;)V
.end method

.method public abstract hideFloatView(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract isFloatViewRequired()Z
.end method

.method public abstract isFloatViewRequired(Ljava/lang/String;)Z
.end method

.method public abstract isLogined(Landroid/app/Activity;)Ljava/lang/String;
.end method

.method public abstract isLogined(Landroid/app/Activity;Ljava/lang/String;)Z
.end method

.method public abstract isSupportLogout()Z
.end method

.method public abstract isSupportLogout(Ljava/lang/String;)Z
.end method

.method public abstract isSupportSwitchAccount()Z
.end method

.method public abstract isSupportSwitchAccount(Ljava/lang/String;)Z
.end method

.method public abstract requestLogin(Landroid/app/Activity;)V
.end method

.method public abstract requestLogin(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract requestLogout(Landroid/app/Activity;)V
.end method

.method public abstract requestLogout(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract requestSwitchAccount(Landroid/app/Activity;)V
.end method

.method public abstract requestSwitchAccount(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract setAccountListener(Lcom/boyaa/godsdk/callback/AccountListener;)V
.end method

.method public abstract showFloatView(Landroid/app/Activity;)V
.end method

.method public abstract showFloatView(Landroid/app/Activity;Ljava/lang/String;)V
.end method
