.class public Lcom/boyaa/godsdk/core/utils/Debug;
.super Ljava/lang/Object;
.source "Debug.java"


# instance fields
.field private mObj:Lcom/boyaa/godsdk/core/IDebugable;

.field private mTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/core/IDebugable;)V
    .locals 1
    .param p1, "obj"    # Lcom/boyaa/godsdk/core/IDebugable;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    .line 17
    invoke-interface {p1}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public d(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    :cond_1
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    :cond_1
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :cond_0
    return-void
.end method

.method public i(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 51
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    :cond_1
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    :cond_0
    return-void
.end method

.method public v(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    :cond_1
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :cond_0
    return-void
.end method

.method public w(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mObj:Lcom/boyaa/godsdk/core/IDebugable;

    invoke-interface {v0}, Lcom/boyaa/godsdk/core/IDebugable;->getDebugMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Debug;->mTag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 66
    :cond_1
    return-void
.end method
