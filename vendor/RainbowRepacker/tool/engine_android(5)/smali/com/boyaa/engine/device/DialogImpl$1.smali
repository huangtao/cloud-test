.class Lcom/boyaa/engine/device/DialogImpl$1;
.super Ljava/lang/Object;
.source "DialogImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/DialogImpl;->onCloseEvent(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/device/DialogImpl;

.field private final synthetic val$idx:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/DialogImpl;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/DialogImpl$1;->this$0:Lcom/boyaa/engine/device/DialogImpl;

    iput p2, p0, Lcom/boyaa/engine/device/DialogImpl$1;->val$idx:I

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/boyaa/engine/device/DialogImpl$1;->this$0:Lcom/boyaa/engine/device/DialogImpl;

    iget v0, v0, Lcom/boyaa/engine/device/DialogImpl;->id:I

    iget v1, p0, Lcom/boyaa/engine/device/DialogImpl$1;->val$idx:I

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/DialogImpl;->nativeEvent(II)V

    .line 22
    return-void
.end method
