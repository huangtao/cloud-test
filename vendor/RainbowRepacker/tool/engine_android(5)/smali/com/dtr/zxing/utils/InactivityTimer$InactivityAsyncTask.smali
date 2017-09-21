.class Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;
.super Landroid/os/AsyncTask;
.source "InactivityTimer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dtr/zxing/utils/InactivityTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InactivityAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dtr/zxing/utils/InactivityTimer;


# direct methods
.method private constructor <init>(Lcom/dtr/zxing/utils/InactivityTimer;)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;->this$0:Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dtr/zxing/utils/InactivityTimer;Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;)V
    .locals 0

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;-><init>(Lcom/dtr/zxing/utils/InactivityTimer;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 101
    const-wide/32 v0, 0x493e0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 102
    iget-object v0, p0, Lcom/dtr/zxing/utils/InactivityTimer$InactivityAsyncTask;->this$0:Lcom/dtr/zxing/utils/InactivityTimer;

    # getter for: Lcom/dtr/zxing/utils/InactivityTimer;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/dtr/zxing/utils/InactivityTimer;->access$1(Lcom/dtr/zxing/utils/InactivityTimer;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 103
    :catch_0
    move-exception v0

    goto :goto_0
.end method
