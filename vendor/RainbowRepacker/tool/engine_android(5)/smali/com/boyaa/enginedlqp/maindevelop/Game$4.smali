.class Lcom/boyaa/enginedlqp/maindevelop/Game$4;
.super Ljava/lang/Object;
.source "Game.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;->showdialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$4;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 356
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->terminateProcess()V

    .line 357
    return-void
.end method
