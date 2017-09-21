.class public interface abstract Lcom/boyaa/godsdk/core/IAnalyticsPlugin;
.super Ljava/lang/Object;
.source "IAnalyticsPlugin.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPlugin;
.implements Lcom/boyaa/godsdk/core/ISpecialMethodCallable;


# virtual methods
.method public abstract getAnalyticName()Ljava/lang/String;
.end method

.method public abstract onEvent(Landroid/app/Activity;Ljava/lang/String;)V
.end method

.method public abstract onEvent(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onKillProcess(Landroid/content/Context;)V
.end method

.method public abstract onPauseSession(Landroid/app/Activity;)V
.end method

.method public abstract onResumeSession(Landroid/app/Activity;)V
.end method

.method public abstract reportError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract reportError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract setCatchUncaughtExceptions(Landroid/content/Context;Z)V
.end method

.method public abstract setSessionContinueMillis(J)V
.end method
