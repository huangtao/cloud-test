.class Lcom/google/protobuf/MapEntry$Metadata;
.super Ljava/lang/Object;
.source "MapEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/MapEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Metadata"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final defaultInstance:Lcom/google/protobuf/MapEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field public final descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

.field public final parser:Lcom/google/protobuf/AbstractParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/AbstractParser",
            "<",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/protobuf/Descriptors$Descriptor;Lcom/google/protobuf/MapEntry;)V
    .locals 2
    .param p1, "descriptor"    # Lcom/google/protobuf/Descriptors$Descriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/Descriptors$Descriptor;",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lcom/google/protobuf/MapEntry$Metadata;, "Lcom/google/protobuf/MapEntry$Metadata<TK;TV;>;"
    .local p2, "defaultInstance":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/google/protobuf/MapEntry$Metadata;->descriptor:Lcom/google/protobuf/Descriptors$Descriptor;

    .line 60
    iput-object p2, p0, Lcom/google/protobuf/MapEntry$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntry;

    .line 61
    move-object v0, p0

    .line 62
    .local v0, "thisMetadata":Lcom/google/protobuf/MapEntry$Metadata;, "Lcom/google/protobuf/MapEntry$Metadata<TK;TV;>;"
    new-instance v1, Lcom/google/protobuf/MapEntry$Metadata$1;

    invoke-direct {v1, p0, p2, v0}, Lcom/google/protobuf/MapEntry$Metadata$1;-><init>(Lcom/google/protobuf/MapEntry$Metadata;Lcom/google/protobuf/MapEntry;Lcom/google/protobuf/MapEntry$Metadata;)V

    iput-object v1, p0, Lcom/google/protobuf/MapEntry$Metadata;->parser:Lcom/google/protobuf/AbstractParser;

    .line 75
    return-void
.end method
