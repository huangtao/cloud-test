.class public Lcom/boyaa/godsdk/core/ActivityAgent;
.super Ljava/lang/Object;
.source "ActivityAgent.java"


# static fields
.field private static mCallbacks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addListener(Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;)V
    .locals 5
    .param p0, "callback"    # Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .prologue
    .line 105
    if-nez p0, :cond_0

    .line 116
    :goto_0
    return-void

    .line 108
    :cond_0
    const/4 v1, 0x0

    .line 110
    .local v1, "result":Z
    :try_start_0
    sget-object v2, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 115
    :goto_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ActivityAgent.addListener == "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mCallbacks == "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 113
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    const-string v3, "ActivityAgent.addListener Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 35
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 38
    return-void

    .line 35
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 36
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0, p1, p2, p3}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public static onCreate(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 23
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 26
    return-void

    .line 23
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 24
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onCreate(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static onDestroy(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 90
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 93
    return-void

    .line 90
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 91
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onDestroy(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 63
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 66
    return-void

    .line 63
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 64
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0, p1}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public static onPause(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 44
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 47
    return-void

    .line 44
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 45
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onPause(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static onRestart(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 99
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 102
    return-void

    .line 99
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 100
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onRestart(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static onResume(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 53
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 56
    return-void

    .line 53
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 54
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onResume(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static onStart(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 72
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 75
    return-void

    .line 72
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 73
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onStart(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static onStop(Landroid/app/Activity;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 81
    sget-object v1, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 84
    return-void

    .line 81
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .line 82
    .local v0, "callback":Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;
    invoke-interface {v0, p0}, Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;->onStop(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method static removeListener(Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;)V
    .locals 5
    .param p0, "callback"    # Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    .prologue
    .line 119
    if-nez p0, :cond_0

    .line 130
    :goto_0
    return-void

    .line 122
    :cond_0
    const/4 v1, 0x0

    .line 124
    .local v1, "result":Z
    :try_start_0
    sget-object v2, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 129
    :goto_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ActivityAgent.removeListener == "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mCallbacks == "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/boyaa/godsdk/core/ActivityAgent;->mCallbacks:Ljava/util/Set;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 127
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v2

    const-string v3, "ActivityAgent.removeListener Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
