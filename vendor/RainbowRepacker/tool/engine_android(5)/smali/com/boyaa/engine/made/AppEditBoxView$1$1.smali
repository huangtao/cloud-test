.class Lcom/boyaa/engine/made/AppEditBoxView$1$1;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView$1;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/engine/made/AppEditBoxView$1;

.field final synthetic val$nDelete:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView$1;I)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$1$1;->this$1:Lcom/boyaa/engine/made/AppEditBoxView$1;

    iput p2, p0, Lcom/boyaa/engine/made/AppEditBoxView$1$1;->val$nDelete:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 89
    iget v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$1$1;->val$nDelete:I

    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->onDeleteBackward(I)V

    .line 90
    return-void
.end method
