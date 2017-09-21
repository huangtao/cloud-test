.class Lcom/boyaa/engine/made/AppGLSurfaceView$7;
.super Ljava/lang/Object;
.source "AppGLSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppGLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;

.field final synthetic val$key:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppGLSurfaceView;I)V
    .locals 0

    .prologue
    .line 198
    iput-object p1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$7;->this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;

    iput p2, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$7;->val$key:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 201
    iget v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$7;->val$key:I

    invoke-static {v0}, Lcom/boyaa/engine/made/GhostLib;->onKeyDown(I)V

    .line 202
    return-void
.end method
