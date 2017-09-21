.class Lcom/boyaa/engine/made/AppActivity$1;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppActivity;

.field final synthetic val$key:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppActivity;I)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/boyaa/engine/made/AppActivity$1;->this$0:Lcom/boyaa/engine/made/AppActivity;

    iput p2, p0, Lcom/boyaa/engine/made/AppActivity$1;->val$key:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/boyaa/engine/made/AppActivity$1;->val$key:I

    invoke-static {v0}, Lcom/boyaa/engine/made/GhostLib;->onKeyDown(I)V

    .line 66
    return-void
.end method
