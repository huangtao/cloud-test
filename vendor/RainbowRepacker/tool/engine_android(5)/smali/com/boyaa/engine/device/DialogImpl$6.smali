.class Lcom/boyaa/engine/device/DialogImpl$6;
.super Ljava/lang/Object;
.source "DialogImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/DialogImpl;->close(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$dialogImpl:Lcom/boyaa/engine/device/DialogImpl;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/DialogImpl;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/DialogImpl$6;->val$dialogImpl:Lcom/boyaa/engine/device/DialogImpl;

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/boyaa/engine/device/DialogImpl$6;->val$dialogImpl:Lcom/boyaa/engine/device/DialogImpl;

    iget-object v0, v0, Lcom/boyaa/engine/device/DialogImpl;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 120
    return-void
.end method
