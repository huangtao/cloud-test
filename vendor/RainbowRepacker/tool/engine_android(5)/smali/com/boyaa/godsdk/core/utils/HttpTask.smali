.class public Lcom/boyaa/godsdk/core/utils/HttpTask;
.super Landroid/os/AsyncTask;
.source "HttpTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_RETRY_TIME:I = 0x3

.field private static final TAG:Ljava/lang/String; = "HttpTask"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDebug:Z

.field private mIsHttpPost:Z

.field private mRetryCount:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 22
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mDebug:Z

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mIsHttpPost:Z

    .line 31
    iput-object p1, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mContext:Landroid/content/Context;

    .line 32
    return-void
.end method

.method private debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mDebug:Z

    if-eqz v0, :cond_0

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HttpTask "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :cond_0
    return-void
.end method


# virtual methods
.method public doGet(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 49
    iput-boolean v1, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mIsHttpPost:Z

    .line 50
    iput v1, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mRetryCount:I

    .line 51
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/boyaa/godsdk/core/utils/HttpTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 52
    return-void
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Landroid/os/Bundle;
    .locals 6
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 57
    const/4 v1, 0x0

    .line 58
    .local v1, "response":Landroid/os/Bundle;
    :goto_0
    if-nez v1, :cond_0

    iget v3, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mRetryCount:I

    const/4 v4, 0x3

    if-lt v3, v4, :cond_1

    .line 82
    .end local v1    # "response":Landroid/os/Bundle;
    :cond_0
    :goto_1
    return-object v1

    .line 60
    .restart local v1    # "response":Landroid/os/Bundle;
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/utils/HttpTask;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 61
    const/4 v1, 0x0

    goto :goto_1

    .line 64
    :cond_2
    const/4 v3, 0x0

    :try_start_0
    aget-object v2, p1, v3

    .line 66
    .local v2, "url":Ljava/lang/String;
    const-string v3, "HttpTask"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "||mRetryCount="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mRetryCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lcom/boyaa/godsdk/core/utils/HttpTask;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v3, "HttpTask"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "||request="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lcom/boyaa/godsdk/core/utils/HttpTask;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-boolean v3, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mIsHttpPost:Z

    if-eqz v3, :cond_3

    .line 69
    new-instance v3, Lcom/boyaa/godsdk/core/utils/HttpUtils;

    iget-object v4, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/boyaa/godsdk/core/utils/HttpUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->doPost(Ljava/lang/String;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 77
    .end local v2    # "url":Ljava/lang/String;
    :goto_2
    const-string v3, "HttpTask"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "||response="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lcom/boyaa/godsdk/core/utils/HttpTask;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget v3, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mRetryCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mRetryCount:I

    goto/16 :goto_0

    .line 71
    .restart local v2    # "url":Ljava/lang/String;
    :cond_3
    :try_start_1
    new-instance v3, Lcom/boyaa/godsdk/core/utils/HttpUtils;

    iget-object v4, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/boyaa/godsdk/core/utils/HttpUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->doGet(Ljava/lang/String;)Landroid/os/Bundle;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    goto :goto_2

    .line 73
    .end local v2    # "url":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/utils/HttpTask;->doInBackground([Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public doPost(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 38
    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mIsHttpPost:Z

    .line 39
    iput v1, p0, Lcom/boyaa/godsdk/core/utils/HttpTask;->mRetryCount:I

    .line 41
    new-array v0, v0, [Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/boyaa/godsdk/core/utils/HttpTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 42
    return-void
.end method

.method protected onPostExecute(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 87
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 88
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/utils/HttpTask;->onPostExecute(Landroid/os/Bundle;)V

    return-void
.end method
