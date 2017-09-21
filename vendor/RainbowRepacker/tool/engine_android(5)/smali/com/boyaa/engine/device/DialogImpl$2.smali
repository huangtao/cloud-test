.class Lcom/boyaa/engine/device/DialogImpl$2;
.super Ljava/lang/Object;
.source "DialogImpl.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/DialogImpl;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/device/DialogImpl;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/DialogImpl;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/DialogImpl$2;->this$0:Lcom/boyaa/engine/device/DialogImpl;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 52
    # getter for: Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;
    invoke-static {}, Lcom/boyaa/engine/device/DialogImpl;->access$0()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl$2;->this$0:Lcom/boyaa/engine/device/DialogImpl;

    iget v1, v1, Lcom/boyaa/engine/device/DialogImpl;->id:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    iget-object v0, p0, Lcom/boyaa/engine/device/DialogImpl$2;->this$0:Lcom/boyaa/engine/device/DialogImpl;

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/engine/device/DialogImpl;->onCloseEvent(I)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/DialogImpl;->access$1(Lcom/boyaa/engine/device/DialogImpl;I)V

    .line 54
    return-void
.end method
