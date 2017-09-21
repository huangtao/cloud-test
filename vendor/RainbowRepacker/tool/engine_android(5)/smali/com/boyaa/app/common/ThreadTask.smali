.class public final Lcom/boyaa/app/common/ThreadTask;
.super Ljava/lang/Object;
.source "ThreadTask.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static start(Landroid/app/Activity;Ljava/lang/String;ZLcom/boyaa/app/common/OnThreadTask;)V
    .locals 2
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "tips"    # Ljava/lang/String;
    .param p2, "enableAbort"    # Z
    .param p3, "ott"    # Lcom/boyaa/app/common/OnThreadTask;

    .prologue
    .line 15
    iput-object p1, p3, Lcom/boyaa/app/common/OnThreadTask;->tips:Ljava/lang/String;

    .line 16
    const/4 v0, 0x0

    iput-object v0, p3, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    .line 17
    new-instance v0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    invoke-direct {v0, p0, p3, p2}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;-><init>(Landroid/app/Activity;Lcom/boyaa/app/common/OnThreadTask;Z)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 18
    return-void
.end method
