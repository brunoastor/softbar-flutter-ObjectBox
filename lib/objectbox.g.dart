// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/produto.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2507433235431568534),
      name: 'Produto',
      lastPropertyId: const IdUid(3, 5963261323796433695),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3360068385614171065),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5606183955403987552),
            name: 'barcode',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5963261323796433695),
            name: 'quantidade',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2507433235431568534),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Produto: EntityDefinition<Produto>(
        model: _entities[0],
        toOneRelations: (Produto object) => [],
        toManyRelations: (Produto object) => {},
        getId: (Produto object) => object.id,
        setId: (Produto object, int id) {
          object.id = id;
        },
        objectToFB: (Produto object, fb.Builder fbb) {
          final barcodeOffset =
              object.barcode == null ? null : fbb.writeString(object.barcode!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, barcodeOffset);
          fbb.addInt64(2, object.quantidade);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Produto()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..barcode = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..quantidade =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Produto] entity fields to define ObjectBox queries.
class Produto_ {
  /// see [Produto.id]
  static final id = QueryIntegerProperty<Produto>(_entities[0].properties[0]);

  /// see [Produto.barcode]
  static final barcode =
      QueryStringProperty<Produto>(_entities[0].properties[1]);

  /// see [Produto.quantidade]
  static final quantidade =
      QueryIntegerProperty<Produto>(_entities[0].properties[2]);
}