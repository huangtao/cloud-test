.class Lcom/boyaa/engine/made/AppEditBoxView$1$2;
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

.field final synthetic val$insertText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView$1;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$1$2;->this$1:Lcom/boyaa/engine/made/AppEditBoxView$1;

    iput-object p2, p0, Lcom/boyaa/engine/made/AppEditBoxView$1$2;->val$insertText:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$1$2;->val$insertText:Ljava/lang/String;

    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->onInsertText(Ljava/lang/String;)V

    .line 100
    return-void
.end method
