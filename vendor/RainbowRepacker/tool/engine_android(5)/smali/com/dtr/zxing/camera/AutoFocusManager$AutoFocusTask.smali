.class final Lcom/dtr/zxing/camera/AutoFocusManager$AutoFocusTask;
.super Landroid/os/AsyncTask;
.source "AutoFocusManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dtr/zxing/camera/AutoFocusManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AutoFocusTask"
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
.field final synthetic this$0:Lcom/dtr/zxing/camera/AutoFocusManager;


# direct methods
.method private constructor <init>(Lcom/dtr/zxing/camera/AutoFocusManager;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/dtr/zxing/camera/AutoFocusManager$AutoFocusTask;->this$0:Lcom/dtr/zxing/camera/AutoFocusManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dtr/zxing/camera/AutoFocusManager;Lcom/dtr/zxing/camera/AutoFocusManager$AutoFocusTask;)V
    .locals 0

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/dtr/zxing/camera/AutoFocusManager$AutoFocusTask;-><init>(Lcom/dtr/zxing/camera/AutoFocusManager;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "voids"    # [Ljava/lang/Object;

    .prologue
    .line 105
    const-wide/16 v0, 0x7d0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :goto_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/AutoFocusManager$AutoFocusTask;->this$0:Lcom/dtr/zxing/camera/AutoFocusManager;

    invoke-virtual {v0}, Lcom/dtr/zxing/camera/AutoFocusManager;->start()V

    .line 110
    const/4 v0, 0x0

    return-object v0

    .line 106
    :catch_0
    move-exception v0

    goto :goto_0
.end method
